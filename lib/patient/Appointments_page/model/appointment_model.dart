class AppointmentModel {
  String? status;
  List<AvailableAppointments>? availableAppointments;

  AppointmentModel({this.status, this.availableAppointments});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['available_appointments'] != null) {
      availableAppointments = <AvailableAppointments>[];
      json['available_appointments'].forEach((v) {
        availableAppointments!.add(AvailableAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (availableAppointments != null) {
      data['available_appointments'] = availableAppointments!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class AvailableAppointments {
  String? date;
  String? day;
  String? status;
  List<Times>? times;

  AvailableAppointments({this.date, this.day, this.status, this.times});

  AvailableAppointments.fromJson(Map<String, dynamic> json) {
    date = json['date'] ?? '';
    day = json['day'];
    status = json['status'];
    if (json['times'] != null) {
      times = <Times>[];
      json['times'].forEach((v) {
        times!.add(Times.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['day'] = day;
    data['status'] = status;
    if (times != null) {
      data['times'] = times!.map((v) => v.toJson()).toList();
    } else {
      times = [];
    }
    return data;
  }
}

class Times {
  int? id;
  String? time;

  Times({this.id, this.time});

  Times.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    return data;
  }
}
