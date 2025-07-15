class AddAppointment{
  String id ;
  String name;
  String date ;
  bool active ;
  List<String> schedule ;
  
  AddAppointment({required this.id , 
  required this.name,
  required this.date,
  required this.active ,
  required this.schedule
  });

  void addtime(String time){
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
    List<String>? schedule,
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