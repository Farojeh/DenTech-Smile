import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/Home/model/appointment.dart';
import 'package:dentech_smile/student/Home/model/day.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    initialhome();
  }
  final apiService = getIt<ApiService>();

  Future<void> initialhome() async {
    List<Day> days = [
      Day(name: "Sunday", id: 0, appointments: []),
      Day(name: "Monday", id: 1, appointments: []),
      Day(name: "Tuesday", id: 2, appointments: []),
      Day(name: "Wednesday", id: 3, appointments: []),
      Day(name: "Thursday", id: 4, appointments: []),
    ];

    try {
      emit(HomeLoading());

      final response =
          await apiService.get(endPoint: "/student-weekly-schedule", token: true);

      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(HomeFailure(errormessage: failure.errorMessage));
        return;
      }

      List<dynamic> week = response.data["weekly_appointments"];

      if (week.isNotEmpty) {
        for (var dayData in week) {
          String dayName = dayData["day"];
          String date = dayData["date"]; // ← هذا هو التاريخ المطلوب
          List<dynamic> appointmentsData = dayData["appointments"];

          // ابحث عن اليوم المناسب في قائمة الأيام
          Day? targetDay = days.firstWhere(
            (d) => d.name.toLowerCase() == dayName.toLowerCase(),
            orElse: () => Day(name: dayName, id: -1, appointments: []),
          );

          if (targetDay.id != -1) {
            // حول المواعيد مع إضافة التاريخ إلى الحقل end
            List<Appointment> appointments =
                appointmentsData.map<Appointment>((a) {
              return Appointment(
                id: a["appointment_id"],
                patient: a["patient_name"] ?? "",
                tag: a["time"]?.substring(0,1) ?? "",
                start: a["time"]?? "",
                date: date, // ← هنا نضيف التاريخ كـ end
                internship: a["stage_name"] ?? "",
              );
            }).toList();
            targetDay.setappointment(appointments);
          }
        }
      }
      emit(HomeSuccess(days: days));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(HomeFailure(errormessage: failure.errorMessage));
      }
    }
  }

  void selectday(int day) {
    final current = (state as HomeSuccess).days;
    emit(HomeSuccess(days: current, select: day));
  }
}
