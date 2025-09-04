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

part 'attendence_report_state.dart';

class AttendenceReportCubit extends Cubit<AttendenceReportState> {
  final Dio dio = Dio();
  AttendenceReportCubit() : super(AttendenceReportInitial());

  final apiService = getIt<ApiService>();

  Future<void> getAttendenceReport(
      {required String id, required String date}) async {
    try {
      emit(AttendenceReportLoading());
      Response response;
      Map<String, String> data = {"practical_schedule_id": id, "date": date};
      response = await apiService.post(
          endPoint: "/attendance-Report", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(AttendenceReportFailure(errormessage: failure.errorMessage));
        return;
      }
      String path = response.data["download_url"];
      await downloadFile("${Static.urlimagewithoutstorage}$path", path);
      emit(AttendenceReportSuccess(path: path));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(AttendenceReportFailure(errormessage: failure.errorMessage));
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
