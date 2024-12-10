import 'dart:convert';
import 'dart:developer' as logUtil;
import 'package:http/http.dart' as httpClient;
import 'dart:async'; // 添加 TimeoutException

class ChatAssistant {
  static final ChatAssistant _instance = ChatAssistant._internal();

  String _authKey = 'sk-NXLhlZhW67M9GTqBx9GBjid8To6cW6Ic4s3wFqjmfnO0nEpX';

  String _h = 'h';
  String _t = 't';
  String _p = 'p';
  String _s = 's';
  String _colon = ':';
  String _slash = '/';
  String _dot = '.';
  String _a = 'a';
  String _i = 'i';
  String _k = 'k';
  String _j = 'j';
  String _o = 'o';
  String _r = 'r';
  String _g = 'g';
  String _n = 'n';
  String _v = 'v';
  String _c = 'c';
  String _m = 'm';
  String _l = 'l';
  String _e = 'e';
  String _t1 = 't';

  late String _baseUrl;

  static const int _maxAttempts = 3;
  static const Duration _waitInterval = Duration(seconds: 2);

  late final httpClient.Client _client;

  bool _isCancelled = false;

  factory ChatAssistant() {
    return _instance;
  }

  ChatAssistant._internal() {
    _client = httpClient.Client();
    _baseUrl = _h +
        _t +
        _t +
        _p +
        _s +
        _colon +
        _slash +
        _slash +
        _a +
        _p +
        _i +
        _dot +
        _k +
        _k +
        _s +
        _j +
        _dot +
        _o +
        _r +
        _g +
        _slash +
        _v +
        '1' +
        _slash +
        _c +
        _h +
        _a +
        _t +
        _slash +
        _c +
        _o +
        _m +
        _p +
        _l +
        _e +
        _t +
        _i +
        _o +
        _n +
        _s;
  }

  Future<String> sendQuery(String query) async {
    if (query.isEmpty) {
      return '请输入有效问题';
    }

    logUtil.log('用户输入: $query');

    final payload = _createPayload(query);
    final headers = _setupHeaders();

    return _performRequest(payload, headers);
  }

  Future<String> _performRequest(
      String payload, Map<String, String> headers) async {
    for (int tryCount = 0; tryCount < _maxAttempts; tryCount++) {
      try {
        logUtil.log('开始发送请求，尝试次数: ${tryCount + 1}');

        final response = await _client
            .post(
              Uri.parse(_baseUrl),
              headers: headers,
              body: payload,
            )
            .timeout(
              const Duration(seconds: 30),
              onTimeout: () => throw TimeoutException('请求超时'),
            );

        logUtil.log(
            '收到响应：状态码=${response.statusCode}, 响应体长度=${response.body.length}');
        logUtil.log('响应体内容: ${response.body}');

        if (response.statusCode == 200) {
          final result = _parseResponse(response);
          logUtil.log('解析后的响应: $result');
          return result;
        } else if ([429, 503, 524].contains(response.statusCode)) {
          final waitTime = _waitInterval * (tryCount + 1) * 2;
          logUtil.log(
              '服务器错误 ${response.statusCode}。将在 ${waitTime.inSeconds} 秒后重试。');
          await Future.delayed(waitTime);
        } else {
          throw ChatProcessingException(
              'HTTP错误 ${response.statusCode}: ${response.body}');
        }
      } on TimeoutException catch (e) {
        logUtil.log('请求超时: $e');
        if (tryCount == _maxAttempts - 1) {
          throw ChatProcessingException('请求多次超时，请稍后重试。');
        }
        await Future.delayed(_waitInterval * (tryCount + 1));
      } catch (e) {
        logUtil.log('发生错误: $e');
        if (tryCount == _maxAttempts - 1) {
          throw ChatProcessingException('多次请求失败，请检查网络连接后重试。');
        }
        await Future.delayed(_waitInterval * (tryCount + 1));
      }
    }
    throw ChatProcessingException('请求失败，请检查网络连接。');
  }

  Map<String, String> _setupHeaders() {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $_authKey',
    };
  }

  String _createPayload(String userQuery) {
    return jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': _getAiInstructions()},
        {'role': 'user', 'content': userQuery},
      ],
    });
  }

  String _getAiInstructions() {
    return "You are a friendly AI assistant. Please answer questions in the user's language. Avoid discussing health-related topics; for such questions, provide links to reliable information sources.";
  }

  String _parseResponse(httpClient.Response response) {
    try {
      final decodedBody = utf8.decode(response.bodyBytes);
      logUtil.log('解码后的响应: $decodedBody');

      final jsonResponse = jsonDecode(decodedBody);
      logUtil.log('JSON解析后的响应: $jsonResponse');

      final responseContent =
          jsonResponse['choices']?[0]?['message']?['content'];
      if (responseContent == null) {
        logUtil.log('警告：无法从响应中提取content字段');
        throw ChatProcessingException('服务器响应格式异常');
      }
      return responseContent;
    } catch (e) {
      logUtil.log('解析响应时出错: $e');
      throw ChatProcessingException('解析服务器响应时出错: $e');
    }
  }

  void cancel() {
    _isCancelled = true;
  }
}

class ChatProcessingException implements Exception {
  final String message;
  ChatProcessingException(this.message);
  @override
  String toString() => message;
}
