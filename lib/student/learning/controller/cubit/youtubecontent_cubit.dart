import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'youtubecontent_state.dart';

class YoutubecontentCubit extends Cubit<YoutubecontentState> {
  YoutubecontentCubit(int id) : super(YoutubecontentInitial()) {
    getpath(id);
  }

  final apiService = getIt<ApiService>();

  Future<void> getpath(int id) async {
    try {
      emit(YoutubecontentLoading());
      Map<String, String> data = {"id": id.toString()};
      Response response;
      response = await apiService.post(
          endPoint: "/show-educational-contents", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Youtubecontentfailure(errormessage: failure.errorMessage));
        return;
      }
      String path = response.data["content"]["content_url"];
      emit(YoutubecontentSuccess(path: path));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Youtubecontentfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
