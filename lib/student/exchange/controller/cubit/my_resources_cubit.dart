import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'my_resources_state.dart';

class MyResourcesCubit extends Cubit<MyResourcesState> {
  MyResourcesCubit() : super(MyResourcesInitial()) {
    initial();
  }
  final apiService = getIt<ApiService>();

  void initial() async {
    try {
      emit(MyResourcesLoading());
      Response response;
      response = await apiService.get(endPoint: "/myResources", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(MyResourcesfailure(errormessage: failure.errorMessage));
        return;
      }
      List<dynamic> resourcejason = response.data["resources"];

      List<Resource> resources = resourcejason
          .map((stageJson) => Resource.setdata2(stageJson))
          .toList();

      emit(MyResourcesSuccess(resources: resources));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(MyResourcesfailure(errormessage: failure.errorMessage));
      }
    }
  }

  void updateStatus(Resource resource) {
    if (state is MyResourcesSuccess) {
      final currentState = state as MyResourcesSuccess;
      final updatedResources = currentState.resources.map((res) {
        if (res.id == resource.id) {
          return Resource(
            id: res.id,
            name: res.name,
            image: res.image,
            type: res.type,
            startdate: res.startdate,
            enddate: res.enddate,
            status: false,
          );
        }
        return res;
      }).toList();

      emit(MyResourcesSuccess(resources: updatedResources));
    }
  }
}
