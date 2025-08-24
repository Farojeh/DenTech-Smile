import 'dart:io';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiService {
  static final _baseUrl = "http://${Static.ipconfig}:8000/api";
  static final dio = Dio()
    ..httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  static final String token =
      '10|nvsUQuImqBPrncjOvFJJ4hzfxeyUztPiLiHul9Y4277e4705';
  static final Map<String, String> headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  ApiService(dio);
  static Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      var response = await dio.get(
        '$_baseUrl$endPoint',
        options: Options(headers: headers),
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

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic data,
  }) async {
    try {
      var response = await dio.post(
        '$_baseUrl$endPoint',
        options: Options(headers: headers),
        data: data,
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
