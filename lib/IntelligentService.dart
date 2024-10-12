import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;

class IntelligentService {
  static final IntelligentService _instance = IntelligentService._internal();
  factory IntelligentService() => _instance;

  static const String _baseUrl = 'https://api.kksj.org';
  static const String _endpoint = '/v1/chat/completions';
  static const String _model = 'gpt-3.5-turbo';

  final ApiClient _apiClient;

  IntelligentService._internal() : _apiClient = ApiClient();

  Future<String> createAnswer(String userInput) async {
    if (userInput.isEmpty) return '请输入有效的问题。';

    dev.log('用户输入: $userInput');

    try {
      final response = await _apiClient.post(
        endpoint: _endpoint,
        body: _buildRequestBody(userInput),
      );
      return _parseResponse(response);
    } on ApiException catch (e) {
      return '发生错误: ${e.message}';
    }
  }

  Map<String, dynamic> _buildRequestBody(String query) {
    return {
      'model': _model,
      'messages': [
        {'role': 'system', 'content': _getSystemPrompt()},
        {'role': 'user', 'content': query},
      ],
    };
  }

  String _getSystemPrompt() {
    return "你是一个友好的AI助手。请用用户的语言回答问题。避免讨论健康相关话题；对于此类问题，请提供可靠信息源的链接。";
  }

  String _parseResponse(Map<String, dynamic> response) {
    return response['choices']?[0]?['message']?['content'] ?? '无法解析响应';
  }
}

class ApiClient {
  static const String _authToken =
      'sk-pWLQ3H6TCvXZwVQg8f36A14d57704c26888f60D05138D2E0';
  static const int _maxRetries = 3;
  static const Duration _initialRetryDelay = Duration(seconds: 2);

  final http.Client _httpClient;

  ApiClient() : _httpClient = http.Client();

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.parse('${IntelligentService._baseUrl}$endpoint');
    final headers = _buildHeaders();

    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        final response = await _httpClient.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          return jsonDecode(utf8.decode(response.bodyBytes));
        } else if (response.statusCode == 429) {
          await _handleRateLimit(attempt);
        } else {
          throw ApiException('HTTP错误 ${response.statusCode}');
        }
      } catch (e) {
        if (attempt == _maxRetries - 1) {
          throw ApiException('多次请求失败。请稍后再试。');
        }
      }
    }
    throw ApiException('请求失败。请检查您的网络连接。');
  }

  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $_authToken',
    };
  }

  Future<void> _handleRateLimit(int attempt) async {
    final delay = _initialRetryDelay * (attempt + 1);
    dev.log('达到速率限制。${delay.inSeconds}秒后重试。');
    await Future.delayed(delay);
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
  @override
  String toString() => message;
}
