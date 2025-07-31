import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'artical_state.dart';

class ArticalCubit extends Cubit<ArticalState> {
  ArticalCubit(int id, String auther) : super(ArticalInitial()) {
    initialArtical(id, auther);
  }

  final apiService = getIt<ApiService>();
  String autherr = "";

  Future<void> initialArtical(int id, String auther) async {
    try {
      autherr = auther;
      emit(ArticalLoading());
      Map<String, String> data = {"id": id.toString()};
      Response response;
      response = await apiService.post(
          endPoint: "/show-educational-contents", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(ArticalFailure(errormessage: failure.errorMessage));
        return;
      }
      String title = response.data["content"]["title"].toString();
      String artical = response.data["content"]["text_content"].toString();
      String time =
          response.data["content"]["created_at"].split(' ')[0].toString();
      List images = response.data["content"]["images"] as List;
      String image;
      bool isimage;
      if (images.isEmpty) {
        image = "assets/images/article.jpg";
        isimage = false;
      } else {
        image = images[0]["image_url"];
        isimage = true;
      }
      emit(ArticalSuccess(
          isimage: isimage,
          image: image,
          title: title,
          author: auther,
          time: time,
          artical: artical));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(ArticalFailure(errormessage: failure.errorMessage));
      }
    }
  }
}
