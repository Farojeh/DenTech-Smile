import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'state_general_state.dart';

class StateGeneralCubit extends Cubit<StateGeneralState> {
  StateGeneralCubit(String id) : super(StateGeneralInitial()) {
    initial(id);
  }

  Future<void> initial(String id) async {
    // try {
    // emit(StatePageloading());
    // Map<String, String> data = {"appointment_id": id};
    // final response = await apiService.post(
    //     endPoint: "/previous-info", data: data, token: true);
    // if (response.statusCode != 200 && response.statusCode != 201) {
    //   var failure =
    //       ServerFaliure.fromResponse(response.statusCode!, response.data);
    //   emit(StatePagefailure(errormessage: failure.errorMessage));
    //   return;
    // }
    // String? des = response.data["previous_description"];
    // String xrayimage = response.data["x_ray"];
    // List<String> beforjson =
    //     (response.data["before_images"] as List<dynamic>?)
    //             ?.map((e) => e.toString())
    //             .toList() ??
    //         [];
    // List<String> befor = List<String>.from(beforjson);
    // List<String> afterjson = (response.data["after_images"] as List<dynamic>?)
    //         ?.map((e) => e.toString())
    //         .toList() ??
    //     [];
    // List<String> after = List<String>.from(afterjson);

    // int patientid = response.data["patient_id"];
    emit(StateGeneralsuccess(
        previousdescription: "good jop",
        appointmentid: "1",
        xrayimage: "assets/images/XRay.png",
        patientid: 1,
        befor: const[],
        after: const []));
    // } catch (error) {
    //   if (error is DioException) {
    //     var failure = ServerFaliure.fromDioException(error);
    //     emit(StatePagefailure(errormessage: failure.errorMessage));
    //   }
    // }
  }
}
