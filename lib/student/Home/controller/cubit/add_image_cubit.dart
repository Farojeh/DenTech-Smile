import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'add_image_state.dart';

class AddImageCubit extends Cubit<AddImageState> {
  AddImageCubit() : super(AddImageInitial());

  final apiService = getIt<ApiService>();

  Future<void> saveimage(String id, String type, String image) async {
    emit(AddImageLoading());

    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry('appointment_id', id),
      MapEntry('type', type),
    ]);
    formData.files.add(
      MapEntry(
        'image[]',
        await MultipartFile.fromFile(
          image,
          filename: image.split('/').last,
        ),
      ),
    );
    Response response;
    try {
      response = await apiService.postfiles(
          endPoint: "/add-image", data: formData, tokenbool: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(AddImagefailure(errormessage: failure.errorMessage));
      } else {
        emit(AddImagesuccess());
      }
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(AddImagefailure(errormessage: failure.errorMessage));
      }
    }
  }
}
