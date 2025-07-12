import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/Home/model/appointment.dart';
import 'package:dentech_smile/student/Home/model/day.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Day> days = [
    Day(name: "Sunday", id: 0, appointments: [
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
    ]),
    Day(name: "Monday", id: 1, appointments: [
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
    ]),
    Day(name: "Tuesday", id: 2, appointments: []),
    Day(name: "Wednesday", id: 3, appointments: [
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
      Appointment(
          patient: "Aleen Morad ",
          tag: "9",
          start: "9 AM",
          end: "11 AM",
          internship: "Tooth extraction internship"),
    ]),
    Day(name: "Thursday", id: 4, appointments: []),
  ];

  void selectday(int day) {
    if (state is HomeInitial) {
      emit((state as HomeInitial).copyWith(select: day));
    }
  }
}
