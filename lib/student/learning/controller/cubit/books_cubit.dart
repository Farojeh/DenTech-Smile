import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(int id) : super(BooksInitial()) {
    initialbook(id);
  }

  final apiService = getIt<ApiService>();

  Future<void> initialbook(int id) async {
    try {
      emit(BooksLoading());
      Map<String, String> data = {"id": id.toString()};
      Response response;
      response = await apiService.post(
          endPoint: "/show-educational-contents", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Booksfailure(errormessage: failure.errorMessage));
        return;
      }
      String path = response.data["content"]["file_path"];
      // await downloadFile("${Static.urlimage}$path");
      emit(BooksSuccess(path: path));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Booksfailure(errormessage: failure.errorMessage));
      }
    }
  }

//   Future<void> downloadFile(String url) async {
//     // طلب صلاحية التخزين
//     var status = await Permission.storage.request();
//     if (!status.isGranted) {
//       emit(Booksfailure(errormessage: "Storage permission denied"));
//       return;
//     }

//     try {
//       final downloadsDir = Directory('/storage/emulated/0/Download');
//       if (!downloadsDir.existsSync()) {
//         downloadsDir.createSync(recursive: true);
//       }

//       final fileName = url.split('/').last;
//       final savePath = '${downloadsDir.path}/$fileName';

//       await Dio().download(url, savePath);

//       emit(BooksSuccess(path: "File downloaded to $savePath"));
//     } catch (e) {
//       emit(Booksfailure(errormessage: "Download failed: $e"));
//     }
//   }
//   // path provider
//   // Permission
}

