import 'package:dentech_smile/student/Home/model/appointment.dart';

class Day {
  String name ;
  int id ;
  List<Appointment> appointments;

  Day({
    required this.name,
    required this.id ,
    required this.appointments
  });

  void setName (String name ){
    this.name = name ;
  }

  void addappointment(Appointment a){
    appointments.add(a);
  }

  List<Appointment> getappointment(){
    return appointments ;
  }

  void setappointment(List<Appointment> apps){
    appointments = apps ;
  }

}
