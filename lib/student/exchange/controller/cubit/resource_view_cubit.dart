import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'resource_view_state.dart';

class ResourceViewCubit extends Cubit<ResourceViewState> {
  ResourceViewCubit(String type) : super(ResourceViewInitial()) {
    String category;
    if (type == "Books and References") {
      category = "Books_and_References";
    } else if (type == "Paper Lectures") {
      category = "Paper_lectures";
    } else if (type == "Medical Instruments") {
      category = "Medical_instruments";
    } else {
      category = "General";
    }
    initial(category);
  }

  final apiService = getIt<ApiService>();

  void initial(String category) async {
    try {
      emit(ResourceViewLoading());
      Map<String, String> data = {"category": category};
      Response response;
      response = await apiService.post(
          endPoint: "/showResourcesByCategory", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(ResourceViewfailure(errormessage: failure.errorMessage));
        return;
      }
      List<dynamic> resourcejason = response.data["resources"];

      List<Resource> resources = resourcejason
          .map((stageJson) => Resource.setdata(stageJson))
          .toList();

      emit(ResourceViewSuccess(resources: resources));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(ResourceViewfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
