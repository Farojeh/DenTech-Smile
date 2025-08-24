class ScheduleModel {
  String? status;
  List<WeeklySchedule>? weeklySchedule;

  ScheduleModel({this.status, this.weeklySchedule});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['weekly_schedule'] != null) {
      weeklySchedule = <WeeklySchedule>[];
      json['weekly_schedule'].forEach((v) {
        weeklySchedule!.add(WeeklySchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (weeklySchedule != null) {
      data['weekly_schedule'] = weeklySchedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeeklySchedule {
  String? day;
  List<Schedules>? schedules;

  WeeklySchedule({this.day, this.schedules});

  WeeklySchedule.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    if (schedules != null) {
      data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedules {
  String? year;
  String? stage;
  String? from;
  String? to;
  int? stage_id;
  int? practical_id;

  Schedules({this.year, this.stage, this.from, this.to});

  Schedules.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    stage = json['stage'];
    from = json['from'];
    to = json['to'];
    stage_id = json['stage_id'];
    practical_id = json['practical_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['stage'] = stage;
    data['from'] = from;
    data['to'] = to;
    data['stage_id'] = stage_id;
    data['practical_id'] = practical_id;
    return data;
  }
}
