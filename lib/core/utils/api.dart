import 'dart:io';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiService {
  static final _baseUrl = "http://${Static.ipconfig}:8000/";
  static final dio = Dio()
    ..httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );


  static Map<String, String> _headers({
    bool withLang = false,
    String langCode = "en",
  }) {
    if (withLang) {
      return {
        'Authorization': 'Bearer ${userInfo!.getString(Static.token)!}',
        'Content-Type': 'application/json',
        'Accept-Language': langCode
      };
    }
    return {
      'Authorization': 'Bearer ${userInfo!.getString(Static.token)!}',
      'Content-Type': 'application/json',
    };
  }

  static Future<Map<String, dynamic>> get({
    required String endPoint,
    bool withLang = false,
    String langCode = "en",
  }) async {
    try {
      var response = await dio.get(
        '$_baseUrl$endPoint',
        options: Options(
          headers: _headers(withLang: withLang, langCode: langCode),
        ),
      );
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(_headers(withLang: withLang, langCode: langCode));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': response.data};
      } else {
        return {
          'success': false,
          'error': response.data['message'] ?? 'حدث خطأ في الخادم',
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'error':
            e.response?.data['message'] ?? e.message ?? 'فشل الاتصال بالخادم',
        'statusCode': e.response?.statusCode,
      };
    } catch (e) {
      return {'success': false, 'error': 'حدث خطأ غير متوقع: ${e.toString()}'};
    }
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic data,
    bool withLang = false,
    String langCode = "en",
  }) async {
    try {
      var response = await dio.post(
        '$_baseUrl$endPoint',
        data: data,
        options: Options(
          headers: _headers(withLang: withLang, langCode: langCode),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': response.data};
      } else {
        return {
          'success': false,
          'error': response.data['message'] ?? 'حدث خطأ في الخادم',
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'error':
            e.response?.data['message'] ?? e.message ?? 'فشل الاتصال بالخادم',
        'statusCode': e.response?.statusCode,
      };
    } catch (e) {
      return {'success': false, 'error': 'حدث خطأ غير متوقع: ${e.toString()}'};
    }
  }
}
