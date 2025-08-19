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

    List<Day> pra = [
      Day(name: "Sunday", id: 0, appointments: []),
      Day(name: "Monday", id: 1, appointments: []),
      Day(name: "Tuesday", id: 2, appointments: []),
      Day(name: "Wednesday", id: 3, appointments: []),
      Day(name: "Thursday", id: 4, appointments: []),
    ];

    final int currenttype = state.type;

    try {
      emit(HomeLoading());

      Response<dynamic> response = await apiService.get(
          endPoint: "/student-weekly-schedule", token: true);

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
          String date = dayData["date"];
          List<dynamic> appointmentsData = dayData["appointments"];

          Day? targetDay = days.firstWhere(
            (d) => d.name.toLowerCase() == dayName.toLowerCase(),
            orElse: () => Day(name: dayName, id: -1, appointments: []),
          );

          if (targetDay.id != -1) {
            List<Appointment> appointments =
                appointmentsData.map<Appointment>((a) {
              return Appointment(
                id: a["appointment_id"],
                patient: a["patient_name"] ?? "",
                tag: a["time"]?.substring(0, a["time"].indexOf(":")) ?? "",
                start: a["time"] ?? "",
                date: date,
                internship: a["stage_name"] ?? "",
              );
            }).toList();
            targetDay.setappointment(appointments);
          }
        }
      }

      response =
          await apiService.get(endPoint: "/practical-schedule", token: true);

      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(HomeFailure(errormessage: failure.errorMessage));
        return;
      }

      Map<String, dynamic> week1 = response.data["schedules"];

      for (var day in pra) {
        if (week1[day.name] != null) {
          day.appointments.addAll(
            (week1[day.name] as List).map((e) {
              return Appointment(
                  id: e["id"],
                  patient: e["stage_name"] ?? "",
                  tag: e["time_from"].substring(0, 2) ?? "",
                  start: "${e["time_from"].substring(0, 5)} ",
                  date: e["time_to"].substring(0, 5) ?? "",
                  internship: "Dr. ${e["supervisor_name"]}");
            }).toList(),
          );
        }
      }

      emit(HomeSuccess(days: days, practical: pra, type: currenttype));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(HomeFailure(errormessage: failure.errorMessage));
      }
    }
  }

  void selectday(int day) {
    final current = (state as HomeSuccess).days;
    final currentpra = (state as HomeSuccess).practical;
    final int currenttype = state.type;
    emit(HomeSuccess(
        days: current, select: day, practical: currentpra, type: currenttype));
  }

  void changetype() {
    final int current = state.type;
    final currentday = (state as HomeSuccess).days;
    final currentpra = (state as HomeSuccess).practical;
    if (current == 0) {
      emit(HomeSuccess(days: currentday, type: 1, practical: currentpra));
    } else {
      emit(HomeSuccess(days: currentday, type: 0, practical: currentpra));
    }
  }
}
