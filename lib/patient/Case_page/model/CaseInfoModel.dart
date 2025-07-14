class CaseInfoModel {
  String? status;
  String? sessionDescription;
  List<String>? appointmentDates;
  List<String>? beforeImages;
  List<String>? afterImages;

  CaseInfoModel(
      {this.status,
      this.sessionDescription,
      this.appointmentDates,
      this.beforeImages,
      this.afterImages});

  CaseInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sessionDescription = json['session_description'];
    appointmentDates = json['appointment_dates'].cast<String>();
    beforeImages = json['before_images'].cast<String>();
    afterImages = json['after_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['session_description'] = sessionDescription;
    data['appointment_dates'] = appointmentDates;
    data['before_images'] = beforeImages;
    data['after_images'] = afterImages;
    return data;
  }
}