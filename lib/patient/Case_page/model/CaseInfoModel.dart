class CaseInfoModel {
  String? status;
  String? sessionDescription;
  List<AppointmentDates>? appointmentDates;
  List<RadiologyImages>? radiologyImages;
  List<BeforeImages>? beforeImages;
  List<AfterImages>? afterImages;

  CaseInfoModel(
      {this.status,
      this.sessionDescription,
      this.appointmentDates,
      this.radiologyImages,
      this.beforeImages,
      this.afterImages});

  CaseInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sessionDescription = json['session_description'];
    if (json['appointment_dates'] != null) {
      appointmentDates = <AppointmentDates>[];
      json['appointment_dates'].forEach((v) {
        appointmentDates!.add(AppointmentDates.fromJson(v));
      });
    }
    if (json['radiology_images'] != null) {
      radiologyImages = <RadiologyImages>[];
      json['radiology_images'].forEach((v) {
        radiologyImages!.add(RadiologyImages.fromJson(v));
      });
    }
    if (json['before_images'] != null) {
      beforeImages = <BeforeImages>[];
      json['before_images'].forEach((v) {
        beforeImages!.add(BeforeImages.fromJson(v));
      });
    }
    if (json['after_images'] != null) {
      afterImages = <AfterImages>[];
      json['after_images'].forEach((v) {
        afterImages!.add(AfterImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['session_description'] = sessionDescription;
    if (appointmentDates != null) {
      data['appointment_dates'] =
          appointmentDates!.map((v) => v.toJson()).toList();
    }
    if (radiologyImages != null) {
      data['radiology_images'] =
          radiologyImages!.map((v) => v.toJson()).toList();
    }
    if (beforeImages != null) {
      data['before_images'] =
          beforeImages!.map((v) => v.toJson()).toList();
    }
    if (afterImages != null) {
      data['after_images'] = afterImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppointmentDates {
  String? date;
  String? time;
  String? isDone;

  AppointmentDates({this.date, this.time, this.isDone});

  AppointmentDates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['isDone'] = isDone;
    return data;
  }
}

class RadiologyImages {
  String? url;

  RadiologyImages({this.url});

  RadiologyImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class BeforeImages {
  String? url;
  String? type;

  BeforeImages({this.url, this.type});

  BeforeImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}

class AfterImages {
  String? url;
  String? type;

  AfterImages({this.url, this.type});

  AfterImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}