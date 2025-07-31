import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/Home/model/add_appointment.dart';
import 'package:dentech_smile/student/Home/model/time_appointment.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'appointment_page_state.dart';

class AppointmentPageCubit extends Cubit<AppointmentPageState> {
  AppointmentPageCubit() : super(AppointmentPageInitial()) {
    initializeAppointments();
  }

  final apiService = getIt<ApiService>();

  void initializeAppointments() async {
    List<AddAppointment> weekAppointments = [
      AddAppointment(
        id: '1',
        name: 'Sunday',
        date: "",
        active: false,
        schedule: [],
        internship: [],
      ),
      AddAppointment(
        id: '2',
        name: 'Monday',
        date: "",
        active: false,
        schedule: [],
        internship: [],
      ),
      AddAppointment(
        id: '3',
        name: 'Tuesday',
        date: "",
        active: false,
        schedule: [],
        internship: [],
      ),
      AddAppointment(
        id: '4',
        name: 'Wednesday',
        date: "",
        active: false,
        schedule: [],
        internship: [],
      ),
      AddAppointment(
        id: '5',
        name: 'Thursday',
        date: "",
        active: false,
        schedule: [],
        internship: [],
      ),
    ];
    try {
      emit(AppointmentPageLoading());
      final response =
          await apiService.get(endPoint: "/appointments", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(AppointmentPagefailure(errormessage: failure.errorMessage));
        return;
      }

      List<dynamic> week = response.data["available_appointments"];

      for (var stage in week) {
        String stageName = stage["stage_name"];
        for (var day in stage["days"]) {
          String dayName = day["day"];
          String date = day["date"];
          List<dynamic> times = day["times"];

          // البحث عن اليوم المطابق داخل weekAppointments
          var appointmentIndex = weekAppointments.indexWhere(
            (a) => a.name.toLowerCase() == dayName.toLowerCase(),
          );

          if (appointmentIndex != -1) {
            var appointment = weekAppointments[appointmentIndex];

            // تفعيل اليوم
            appointment.active = true;

            // تحديث التاريخ (يمكن أن نأخذ آخر تاريخ إذا تكرر)
            appointment.date = date;

            // إضافة اسم الستاج إذا لم يكن موجود مسبقاً
            if (!appointment.internship.contains(stageName)) {
              appointment.internship.add(stageName);
            }

            // إضافة الأوقات بدون تكرار
            for (var t in times) {
              if (!appointment.schedule.any((sch) => sch.id == t["id"])) {
                appointment.schedule.add(TimeAppointment(
                  id: t["id"],
                  time: t["time"],
                ));
              }
            }

            // تحديث العنصر في القائمة
            weekAppointments[appointmentIndex] = appointment;
          }
        }
      }
      emit(AppointmentPageSuccess(appointments: weekAppointments));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(AppointmentPagefailure(errormessage: failure.errorMessage));
      }
    }
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

  Future<void> addTimeToDay(String id, String time, String date) async {
    if (state is AppointmentPageSuccess) {
      final current = (state as AppointmentPageSuccess).appointments;
      bool deal = false;
      try {
        emit(Appointmentsubloading(appointments: current));
        List<String> parts = date.split('-');
        date = "${parts[2]}-${parts[1]}-${parts[0]}";
        Map<String, String> data = {"date": date, "time": time};
        final response = await apiService.post(
            endPoint: "/add-appointment", data: data, token: true);
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(Appointmentsubfailure(
              appointments: current, errormessage: failure.errorMessage));
          return;
        }
        deal = true;
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(Appointmentsubfailure(
              errormessage: failure.errorMessage, appointments: current));
        }
      }
      if (deal) {
        final index = current.indexWhere((element) => element.id == id);

        if (index == -1) return;
        final updated = List<AddAppointment>.from(current);
        final updatedSchedule =
            List<TimeAppointment>.from(updated[index].schedule);
        TimeAppointment time1 = TimeAppointment(time: time, id: 1);
        updatedSchedule.add(time1);

        updated[index] = updated[index].copyWith(schedule: updatedSchedule);

        emit(AppointmentPageSuccess(appointments: updated));
      }
    }
  }

  Future<void> deleteappointment(String idday, int idtime) async {
    if (state is AppointmentPageSuccess) {
      final current = (state as AppointmentPageSuccess).appointments;
      bool deal = false;
      try {
        emit(Appointmentsubloading(appointments: current));
        Map<String, String> data = {"available_id": idtime.toString()};
        final response = await apiService.post(
            endPoint: "/delete-appointment", data: data, token: true);
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(Appointmentsubfailure(
              appointments: current, errormessage: failure.errorMessage));
          return;
        }
        deal = true;
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(Appointmentsubfailure(
              errormessage: failure.errorMessage, appointments: current));
        }
      }
      if (deal == true) {
        final index = current.indexWhere((element) => element.id == idday);
        if (index == -1) return;

        final updated = List<AddAppointment>.from(current);
        final updatedSchedule =
            List<TimeAppointment>.from(updated[index].schedule);

        // حذف الموعد من اللست
        updatedSchedule.removeWhere((element) => element.id == idtime);

        // تحديث اليوم بعد الحذف
        updated[index] = updated[index].copyWith(schedule: updatedSchedule);

        // إعادة إصدار الحالة
        emit(AppointmentPageSuccess(appointments: updated));
      }
    }
  }
}
