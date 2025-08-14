import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());

  final apiService = getIt<ApiService>();

  Future<bool> setimage(String image) async {
    try {
      FormData formData = FormData();
      formData.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            image,
            filename: image.split('/').last,
          ),
        ),
      );
      Response response;
      response = await apiService.postfiles(
          endPoint: "/upload-profile-image", data: formData, tokenbool: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(ProfileImagefailure(errormessage: failure.errorMessage));
        return false;
      }
      emit(ProfileImagesuccess());
      return true;
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(ProfileImagefailure(errormessage: failure.errorMessage));
        return false;
      }
      return false;
    }
  }
}
