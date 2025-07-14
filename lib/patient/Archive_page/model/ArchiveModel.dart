// ignore_for_file: file_names

class ArchiveModel {
  String? status;
  List<StudentsArchive>? students;

  ArchiveModel({this.status, this.students});

  ArchiveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['students'] != null) {
      students = <StudentsArchive>[];
      json['students'].forEach((v) {
        students!.add(new StudentsArchive.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentsArchive {
  int? studentId;
  String? name;
  String? year;
  String? stageName;
  int? stageId;
  double? averageEvaluation;

  StudentsArchive(
      {this.studentId,
      this.name,
      this.year,
      this.stageName,
      this.stageId,
      this.averageEvaluation});

  StudentsArchive.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    name = json['name'];
    year = json['year'];
    stageName = json['stage_name'];
    stageId = json['stage_id'];
    averageEvaluation = json['average_evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['name'] = name;
    data['year'] = year;
    data['stage_name'] = stageName;
    data['stage_id'] = stageId;
    data['average_evaluation'] = averageEvaluation;
    return data;
  }
}