import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

part 'portfolio_pdf_state.dart';

class PortfolioPdfCubit extends Cubit<PortfolioPdfState> {
  final Dio dio = Dio();
  PortfolioPdfCubit() : super(PortfolioPdfInitial()) {
    initialportfolio();
  }

  final apiService = getIt<ApiService>();

  Future<void> initialportfolio() async {
    try {
      emit(PortfolioPdfLoading());
      Response response;
      response =
          await apiService.get(endPoint: "/portfolio/download", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(PortfolioPdffailure(errormessage: failure.errorMessage));
        return;
      }
      
      String path = response.data["url"];
      await downloadFile("${Static.urlimagewithoutstorage}$path", path);
      
      emit(PortfolioPdfSuccess(path: path));
    } catch (error) {
      print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      print(error.toString());
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(PortfolioPdffailure(errormessage: failure.errorMessage));
      }
    }
  }

  Future<void> downloadFile(String url, String fileName) async {
    // طلب الصلاحيات (يدعم Android 11+)
    if (await Permission.manageExternalStorage.request().isGranted ||
        await Permission.storage.request().isGranted) {
      try {
        // مسار مجلد Download
        final downloadsDir = Directory('/storage/emulated/0/Download');
        if (!await downloadsDir.exists()) {
          throw Exception('Downloads directory not found');
        }

        final filePath = '${downloadsDir.path}/$fileName';

        // تحميل الملف باستخدام Dio
        final response = await dio.download(
          url,
          filePath,
          options: Options(responseType: ResponseType.bytes),
        );

        if (response.statusCode == 200) {
          await OpenFilex.open(filePath); // فتح الملف بعد التحميل
        } else {
          throw Exception('Failed to download file: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Error downloading PDF: $e');
      }
    } else {
      // إذا تم رفض الإذن
      throw Exception(
          'Storage permission denied. Please enable it from settings.');
    }
  }
}
