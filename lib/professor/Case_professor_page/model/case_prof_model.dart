class CaseProfModel {
  String? studentName;
  String? studentImage;
  String? stage;
  String? patientName;
  int? patientid;
  String? description;
  String? radiologyImage;
  List<String>? beforeImages;
  List<String>? afterImages;

  CaseProfModel(
      {this.studentName,
      this.studentImage,
      this.stage,
      this.patientName,
      this.patientid ,
      this.description,
      this.radiologyImage,
      this.beforeImages,
      this.afterImages});

  CaseProfModel.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    studentImage = json['student_image'] ?? '';
    stage = json['stage'];
    patientName = json['patient_name'];
    patientid = json['patient_id']??0;
    description = json['description'];
    radiologyImage = json['radiology_image'] ?? '';
    beforeImages = json['before_images'].cast<String>() ?? [];
    afterImages = json['after_images'].cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_name'] = studentName;
    data['student_image'] = studentImage;
    data['stage'] = stage;
    data['patient_name'] = patientName;
    data['description'] = description;
    data['radiology_image'] = radiologyImage;
    data['before_images'] = beforeImages;
    data['after_images'] = afterImages;
    return data;
  }
}