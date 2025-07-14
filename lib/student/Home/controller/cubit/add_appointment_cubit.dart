import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_appointment_state.dart';

class AddAppointmentCubit extends Cubit<AddAppointmentState> {
  AddAppointmentCubit() : super(AddAppointmentInitial());

  String dated = "";
  String datem = "";
  String datey = "";

  String timeh = "";
  String timem = "";

  String timeam = "";

  void setdate({required String d, required String m, required String y}) {
    dated = d;
    datem = m;
    datey = y;
    String date = "$dated-$datem-$datey";
    emit(state.copyWith(date: date));
  }

  void settime({required String h, required String m, required String am}) {
    timeh = h;
    timem = m;
    timeam = am;
    String time = "$h:$m";
    emit(state.copyWith(time: time, am: am));
  }

  void save() {
    if (state.time == "00:00" || state.date == "dd/mm/yyyy") {
      emit(const AddAppointmentfailure(
          errormessage: "Time and Date are Required"));
    } else {
      emit(AddAppointmentSuccess());
    }
  }
}
