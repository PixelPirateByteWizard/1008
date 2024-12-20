import 'dart:convert';
import 'dart:developer' as logger;
import 'package:http/http.dart' as http;
import 'dart:async'; // 添加这行来导入 TimeoutException
import 'prompt_builder.dart';

class SGMessageService {
  static final SGMessageService _instance = SGMessageService._internal();

  late final String _apiEndpoint =
      Datamessage("戰戬戬戨戫扢扷扷戹戨戱扶戳戳戫戲扶户截房扷戮扩扷戻戰戹戬扷戻户戵戨戴戽戬戱户戶戫");

  static const int _maxRetryAttempts = 3;
  static const Duration _retryInterval = Duration(seconds: 2);

  late final http.Client _client;

  factory SGMessageService() {
    return _instance;
  }

  SGMessageService._internal() {
    _client = http.Client();
  }

  Future<String> processUserMessage(String userMessage) async {
    if (userMessage.isEmpty) {
      return '请输入有效问题';
    }
    final requestBody = createRequestPayload(userMessage);
    return executeApiRequest(requestBody, createRequestHeaders());
  }

  Future<String> executeApiRequest(
      String payload, Map<String, String> headers) async {
    for (int retryCount = 0; retryCount < _maxRetryAttempts; retryCount++) {
      try {
        final response = await _client
            .post(
              Uri.parse(_apiEndpoint),
              headers: headers,
              body: payload,
            )
            .timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          final responseContent = parseResponseContent(response);
          return responseContent ?? '服务器响应为空';
        }

        if ([429, 503, 524].contains(response.statusCode)) {
          await Future.delayed(_retryInterval * (retryCount + 1));
          continue;
        }

        logger.log('HTTP错误 ${response.statusCode}: ${response.body}');
        return '服务请求失败，请稍后重试';
      } catch (e) {
        if (retryCount == _maxRetryAttempts - 1) {
          return e is TimeoutException ? '请求超时，请稍后重试' : '网络连接失败，请检查网络设置';
        }
        await Future.delayed(_retryInterval * (retryCount + 1));
      }
    }
    return '服务暂时不可用，请稍后重试';
  }

  Map<String, String> createRequestHeaders() {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization':
          'Bearer sk-kyosTzL0b0ydJkRXPHvll7hxCRIyMTF0xTOao1vfcEHZUKCU',
    };
  }

  String createRequestPayload(String userMessage) => jsonEncode({
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': PromptBuilder.buildSystemPrompt()},
          {'role': 'user', 'content': userMessage}
        ],
        'temperature': 0.8,
        'max_tokens': 1000,
      });

  String? parseResponseContent(http.Response response) {
    try {
      return jsonDecode(utf8.decode(response.bodyBytes))['choices']?[0]
          ?['message']?['content'];
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

String Datamessage(String input) {
  return String.fromCharCodes(input.runes.map((r) => r ^ 25176));
}
