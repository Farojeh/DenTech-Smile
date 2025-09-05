class DoctorArchiveModel {
  int? sessionId;
  int? studentId;
  int? stageId;
  String? stageName;
  String? studentName;
  String? studentImage;
  double? evaluationScore;
  String? supervisorComments;
  String? patientName;
  String? appointmentDate;

  DoctorArchiveModel(
      {this.sessionId,
      this.studentId,
      this.stageId,
      this.stageName,
      this.studentName,
      this.studentImage,
      this.evaluationScore,
      this.supervisorComments,
      this.patientName,
      this.appointmentDate});

  DoctorArchiveModel.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    studentId = json['student_id'];
    stageId = json['stage_id'];
    stageName = json['stage_name'];
    studentName = json['student_name'];
    studentImage = json['student_image'];
    evaluationScore = json['evaluation_score'] == null
        ? evaluate(null)
        : evaluate(json['evaluation_score'].toString());
    supervisorComments = json['supervisor_comments'] ?? '';
    patientName = json['patient_name'];
    appointmentDate = json['appointment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_id'] = sessionId;
    data['student_id'] = studentId;
    data['stage_id'] = stageId;
    data['stage_name'] = stageName;
    data['student_name'] = studentName;
    data['student_image'] = studentImage;
    data['evaluation_score'] = evaluationScore;
    data['supervisor_comments'] = supervisorComments;
    data['patient_name'] = patientName;
    data['appointment_date'] = appointmentDate;
    return data;
  }

  double evaluate(String? number) {
    if (number == null) {
      return 0.0;
    }
    double result =  num.parse(number).toDouble();
    return result;
  }
}
