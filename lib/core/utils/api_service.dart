import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "http://${Static.ipconfig}:8000/api";
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, bool token = false}) async {
    Response response;
    if (token == false) {
      response = await _dio.get('$_baseUrl$endPoint');
    } else {
      String token = userInfo!.getString(Static.token)!;
      response = await _dio.get('$_baseUrl$endPoint',
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));
    }
    return response.data;
  }

  Future<Response> post(
      {required String endPoint,
      required Map<String, dynamic> data,
      bool token = false}) async {
    Response response;
    if (token == false) {
      response = await _dio.post('$_baseUrl$endPoint', data: data);
    } else {
      String token = userInfo!.getString(Static.token)!;
      response = await _dio.post('$_baseUrl$endPoint',
          data: data,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));
    }

    return response;
  }

  Future<Response> postfiles(
      {required String endPoint,
      required FormData data,
      bool tokenbool = false}) async {
    Response response;
    if (tokenbool == false) {
      response = await _dio.post('$_baseUrl$endPoint', data: data);
    } else {
      String token = userInfo!.getString(Static.token)!;
      response = await _dio.post('$_baseUrl$endPoint',
          data: data,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));
    }
    return response;
  }
}
