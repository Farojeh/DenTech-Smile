import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/Home/model/add_appointment.dart';
import 'package:meta/meta.dart';

part 'appointment_page_state.dart';

class AppointmentPageCubit extends Cubit<AppointmentPageState> {
  AppointmentPageCubit() : super(AppointmentPageInitial()) {
    initializeAppointments();
  }

  void initializeAppointments() {
    List<AddAppointment> weekAppointments = [
      AddAppointment(
        id: '1',
        name: 'Sunday',
        date: "3-2-2025",
        active: true,
        schedule: ["9 AM", "11 AM"],
      ),
      AddAppointment(
        id: '2',
        name: 'Monday',
        date: "4-2-2025",
        active: false,
        schedule: [],
      ),
      AddAppointment(
        id: '3',
        name: 'Tuesday',
        date: "5-2-2025",
        active: true,
        schedule: ["12 PM", "2 PM"],
      ),
      AddAppointment(
        id: '4',
        name: 'Wednesday',
        date: "6-2-2025",
        active: false,
        schedule: [],
      ),
      AddAppointment(
        id: '5',
        name: 'Thursday',
        date: "7-2-2025",
        active: false,
        schedule: [],
      ),
    ];

    emit(AppointmentPageSuccess(appointments: weekAppointments));
  }

  void toggleDayActive(String id) {
    if (state is AppointmentPageSuccess) {
      final current = (state as AppointmentPageSuccess).appointments;
      final index = current.indexWhere((element) => element.id == id);

      if (index == -1) return;
      final updated = List<AddAppointment>.from(current);
      final currentItem = updated[index];

      updated[index] = currentItem.copyWith(active: !currentItem.active);

      emit(AppointmentPageSuccess(appointments: updated));
    }
  }

  void addTimeToDay(String id, String time) {
    if (state is AppointmentPageSuccess) {
      final current = (state as AppointmentPageSuccess).appointments;
      final index = current.indexWhere((element) => element.id == id);

      if (index == -1) return;
      final updated = List<AddAppointment>.from(current);
      final updatedSchedule = List<String>.from(updated[index].schedule);
      updatedSchedule.add(time);

      updated[index] = updated[index].copyWith(schedule: updatedSchedule);

      emit(AppointmentPageSuccess(appointments: updated));
    }
  }
}
