import 'dart:convert';
import 'dart:developer' as logger;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'prompt_builder.dart';
import 'dart:math';

class auravelleService {
  static final auravelleService _instance = auravelleService._internal();

  late final String _apiEndpoint = decrypt("懦懺懺懾懽憴憡憡懯懾懧憠懥懥懽懤憠懡懼懩憡懸憿憡懭懦懯懺憡懭懡懣懾懢懫懺懧懡懠懽");
  static const String _API_KEY =
      'sk-HCwevRYzmTB3Xu4fOLllyVOZEMG6TbOazMjDB5ol499sjxOx';

  static const int _MAX_RETRY_COUNT = 5;
  static const Duration _BACKOFF_INTERVAL = Duration(seconds: 1);
  static const Duration _REQUEST_TIMEOUT = Duration(seconds: 30);

  late final http.Client _client;

  factory auravelleService() {
    return _instance;
  }

  auravelleService._internal() {
    _client = http.Client();
  }

  Future<String> processQuery(String userInput) async {
    if (userInput.isEmpty) {
      return '请输入有效问题';
    }
    final requestData = createRequestBody(userInput);
    logger.log('发送请求到: $_apiEndpoint');
    logger.log('请求内容: $requestData');
    return executeRequest(requestData, getHeaders());
  }

  Future<String> executeRequest(
      String requestData, Map<String, String> headers) async {
    int retryCount = 0;
    while (retryCount < _MAX_RETRY_COUNT) {
      try {
        logger.log('尝试第 ${retryCount + 1} 次请求');

        final responseCompleter = Completer<http.Response>();
        final request = _client.post(
          Uri.parse(_apiEndpoint),
          headers: headers,
          body: requestData,
        );

        final response = await request.timeout(
          _REQUEST_TIMEOUT,
          onTimeout: () {
            throw TimeoutException('请求超时，已经等待 ${_REQUEST_TIMEOUT.inSeconds} 秒');
          },
        );

        logger.log('收到响应状态码: ${response.statusCode}');

        if (response.statusCode == 200) {
          final content = parseResponse(response);
          if (content != null) {
            logger.log('解析后的响应内容: $content');
            return content;
          }
          throw Exception('响应内容为空');
        }

        if (response.statusCode == 429) {
          await Future.delayed(_BACKOFF_INTERVAL * (retryCount + 2));
          retryCount++;
          continue;
        }

        if (response.statusCode >= 500) {
          await Future.delayed(_BACKOFF_INTERVAL);
          retryCount++;
          continue;
        }

        throw Exception('HTTP错误 ${response.statusCode}: ${response.body}');
      } on TimeoutException catch (e) {
        logger.log('请求超时: $e');
        if (retryCount == _MAX_RETRY_COUNT - 1) {
          return '网络请求超时 (${_REQUEST_TIMEOUT.inSeconds}秒)，请检查网络连接后重试';
        }
        await Future.delayed(_BACKOFF_INTERVAL * pow(2, retryCount));
        retryCount++;
      } catch (e) {
        logger.log('请求失败: $e');
        if (retryCount == _MAX_RETRY_COUNT - 1) {
          return '服务暂时不可用，请稍后重试';
        }
        await Future.delayed(_BACKOFF_INTERVAL);
        retryCount++;
      }
    }
    return '无法连接到服务器，请检查网络设置';
  }

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $_API_KEY',
    };
  }

  String createRequestBody(String userInput) => jsonEncode({
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': PromptBuilder.buildSystemPrompt()},
          {'role': 'user', 'content': userInput}
        ],
        'temperature': 0.8,
        'max_tokens': 10000,
      });

  String? parseResponse(http.Response apiResponse) {
    try {
      final rawResponse = utf8.decode(apiResponse.bodyBytes);
      logger.log('原始响应体: $rawResponse');

      final parsedData = jsonDecode(rawResponse);
      final result = parsedData['choices']?[0]?['message']?['content'];

      if (result == null) {
        logger.log('响应中未找到内容');
        return null;
      }

      return result;
    } catch (e) {
      logger.log('解析服务器响应时出错: $e');
      return null;
    }
  }
}

class AIServiceException implements Exception {
  final String message;
  AIServiceException(this.message);
  @override
  String toString() => message;
}

String decrypt(String input) {
  return String.fromCharCodes(input.runes.map((r) => r ^ 24974));
}
