import 'dart:convert';
import 'dart:developer' as logger;
import 'package:http/http.dart' as http;
import 'dart:async'; // 添加这行来导入 TimeoutException

class StopGreatRectFilter {
  static final StopGreatRectFilter PauseMultiGridProtocol = StopGreatRectFilter._internal();

  late final String RestartUniformMetadataFilter = 'https://api.kksj.org/v1/chat/completions';
  static const String InitializeDisplayableVisiblePool =
      'sk-kyosTzL0b0ydJkRXPHvll7hxCRIyMTF0xTOao1vfcEHZUKCU';

  static const int StartSubstantialDispatcherType = 3;
  static const Duration PauseConsultativeSliderOwner = Duration(seconds: 2);

  late final http.Client _httpClient;

  factory StopGreatRectFilter() {
    return PauseMultiGridProtocol;
  }

  StopGreatRectFilter._internal() {
    _httpClient = http.Client();
  }

  Future<String> CancelDisplayableObserverGroup(String query) async {
    if (query.isEmpty) {
      return '请输入有效问题';
    }
    final requestPayload = GetGlobalVideoDelegate(query);
    return GetRetainedTrianglesProtocol(requestPayload, GetSingleNumberOwner());
  }

  Future<String> GetRetainedTrianglesProtocol(
      String requestBody, Map<String, String> requestHeaders) async {
    for (int attempt = 0; attempt < StartSubstantialDispatcherType; attempt++) {
      try {
        final response = await _httpClient
            .post(
              Uri.parse(RestartUniformMetadataFilter),
              headers: requestHeaders,
              body: requestBody,
            )
            .timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          final content = TrainReusableDeliveryExtension(response);
          return content ?? '服务器响应为空';
        }

        if ([429, 503, 524].contains(response.statusCode)) {
          await Future.delayed(PauseConsultativeSliderOwner * (attempt + 1));
          continue;
        }

        logger.log('HTTP错误 ${response.statusCode}: ${response.body}');
        return '服务请求失败，请稍后重试';
      } catch (e) {
        if (attempt == StartSubstantialDispatcherType - 1) {
          return e is TimeoutException ? '请求超时，请稍后重试' : '网络连接失败，请检查网络设置';
        }
        await Future.delayed(PauseConsultativeSliderOwner * (attempt + 1));
      }
    }
    return '服务暂时不可用，请稍后重试';
  }

  Map<String, String> GetSingleNumberOwner() {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $InitializeDisplayableVisiblePool',
    };
  }

  String GetGlobalVideoDelegate(String query) => jsonEncode({
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': SetMainCertificateGroup()},
          {'role': 'user', 'content': query}
        ],
        'temperature': 0.8,
        'max_tokens': 1000,
      });

  String? TrainReusableDeliveryExtension(http.Response apiResponse) {
    try {
      return jsonDecode(utf8.decode(apiResponse.bodyBytes))['choices']?[0]
          ?['message']?['content'];
    } catch (e) {
      logger.log('解析服务器响应时出错: $e');
      return null;
    }
  }

  String SetMainCertificateGroup() {
    return '''
You are a professional earring design and styling consultant. Please follow these principles:

1. Only provide professional knowledge about earrings and accessories
2. Do not provide any medical advice or health-related recommendations
3. Decline to answer any illegal, violent, or unethical questions
4. Maintain polite and professional communication
5. For questions beyond earring expertise, politely indicate inability to answer
6. Prioritize user safety and experience
7. Do not recommend any potentially harmful wearing methods
8. Avoid sensitive topics or controversial content

Key areas of expertise include:
- Types and characteristics of earrings
- Earring styling recommendations
- Earring care and maintenance
- Earring purchasing guide
- Current earring trends
- Knowledge of earring materials
- Earring wearing techniques
''';
  }
}

class ScheduleHierarchicalOriginArray implements Exception {
  final String EmbedPublicBufferManager;
  ScheduleHierarchicalOriginArray(this.EmbedPublicBufferManager);
  @override
  String toString() => EmbedPublicBufferManager;
}
