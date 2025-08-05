import 'package:dentech_smile/student/Home/model/time_appointment.dart';

class AddAppointment{
  String id ;
  String name;
  String date ;
  bool active ;
  List<TimeAppointment> schedule ;
  
  AddAppointment({required this.id , 
  required this.name,
  required this.date,
  required this.active ,
  required this.schedule,
  });

  void addtime(TimeAppointment time){
    schedule.add(time);
  }

  void changeactive(){
     active=!active;
  }

  AddAppointment copyWith({
    String? id,
    String? name,
     String? date,
    bool? active,
    List<TimeAppointment>? schedule,
    List<String>? internship,
  }) {
    return AddAppointment(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date??this.date,
      active: active ?? this.active,
      schedule: schedule ?? List.from(this.schedule),
    );
  }

}