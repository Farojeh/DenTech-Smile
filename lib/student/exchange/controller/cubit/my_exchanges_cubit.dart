import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'my_exchanges_state.dart';

class MyExchangesCubit extends Cubit<MyExchangesState> {
  MyExchangesCubit() : super(MyExchangesInitial()){
     initial();
  }
  
  final apiService = getIt<ApiService>();

  void initial()async{
     try {
      emit(MyExchangesLoading());
      Response response;
      response = await apiService.get(
          endPoint: "/myRequestedResources", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(MyExchangesfailure(errormessage: failure.errorMessage));
        return;
      }
      List<dynamic> resourcejason = response.data["requested_resources"];

      List<Resource> resources = resourcejason
          .map((stageJson) => Resource.setdata(stageJson))
          .toList();

      emit(MyExchangesSuccess(resources: resources));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(MyExchangesfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
