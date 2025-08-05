import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'state_page_state.dart';

class StatePageCubit extends Cubit<StatePageState> {
  StatePageCubit(String id) : super(StatePageInitial()) {
    initial(id);
  }

  bool exit = true ;
  bool des1 = false ;
  bool image1 = false ;

  final apiService = getIt<ApiService>();

  Future<void> initial(String id) async {
    try {
      emit(StatePageloading());
      Map<String, String> data = {"appointment_id": id};
      final response = await apiService.post(
          endPoint: "/previous-info", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(StatePagefailure(errormessage: failure.errorMessage));
        return;
      }
      String? des = response.data["previous_description"];
      String xrayimage = response.data["x_ray"];
      List<String> beforjson =
          (response.data["before_images"] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [];
      List<String> befor = List<String>.from(beforjson);
      List<String> afterjson = (response.data["after_images"] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [];
      List<String> after = List<String>.from(afterjson);

      int patientid = response.data["patient_id"];
      emit(StatePagesuccess(
          appointmentid: id,
          previousdescription: des,
          patientid: patientid,
          xrayimage: xrayimage,
          befor: befor,
          after: after));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(StatePagefailure(errormessage: failure.errorMessage));
      }
    }
  }

  void setdes(String des) {
    final currentstate = (state as StatePagesuccess);
    des1 = true ;

    emit(StatePagesuccess(
        previousdescription: des,
        patientid: currentstate.patientid,
        appointmentid: currentstate.appointmentid,
        xrayimage: currentstate.xrayimage,
        befor: currentstate.befor,
        after: currentstate.after));
  }

  int setbeforimage(String image) {
    final currentstate = (state as StatePagesuccess);
    final List<String> befor = currentstate.befor;
    befor.add(image);
    int ind = befor.length - 1;
    image1 = true ;

    emit(StatePagesuccess(
        previousdescription: currentstate.previousdescription,
        patientid: currentstate.patientid,
        appointmentid: currentstate.appointmentid,
        xrayimage: currentstate.xrayimage,
        befor: befor,
        after: currentstate.after));

    return ind;
  }

   int setafterimage(String image) {
    final currentstate = (state as StatePagesuccess);
    final List<String> after = currentstate.after;
    after.add(image);
    int ind = after.length - 1;
    image1 = true ;

    emit(StatePagesuccess(
        previousdescription: currentstate.previousdescription,
        patientid: currentstate.patientid,
        appointmentid: currentstate.appointmentid,
        xrayimage: currentstate.xrayimage,
        befor: currentstate.befor,
        after: after));

    return ind;
  }


  Future<String> savedesc(String id , String des) async {
    if(des1){
      exit = true ;
    }
    if(!des1 && image1){
      exit = false ;
    }
    if(id=="null"||des=="null" || exit ){
      return"successs" ;
    }
    try {
      Map<String, String> data = {"appointment_id": id, "description": des};
      final response = await apiService.post(
          endPoint: "/add-description", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        return failure.errorMessage ;
      }
      return"success";
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
         return failure.errorMessage ;
      }
      return error.toString() ;
    }
  }
}
