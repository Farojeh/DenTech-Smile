import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/archive/model/archive_two.dart';
import 'package:meta/meta.dart';

part 'state_general_state.dart';

class StateGeneralCubit extends Cubit<StateGeneralState> {
  StateGeneralCubit(ArchiveTwo model) : super(StateGeneralInitial()) {
    initial(model);
  }

  Future<void> initial(ArchiveTwo model) async {
    emit(StateGeneralsuccess(
        previousdescription: model.description,
        supervisorcomments: model.supervisorcomments,
        appointmentid: "1",
        xrayimage: model.xrayimage,
        patientid: model.patientid,
        befor: model.befor,
        after: model.after));
    // } catch (error) {
    //   if (error is DioException) {
    //     var failure = ServerFaliure.fromDioException(error);
    //     emit(StatePagefailure(errormessage: failure.errorMessage));
    //   }
    // }
  }
}
