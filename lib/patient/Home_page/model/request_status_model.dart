class RequestStatusModel {
  int? id;
  String? status;
  int? stageId;
  String? stageName;
  List<StudentsStage>? students;

  RequestStatusModel({
    this.id,
    this.status,
    this.stageId,
    this.stageName,
    this.students,
  });

  RequestStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    stageId = json['stage_id'];
    stageName = json['stage_name'];
    if (json['students'] != null) {
      students = <StudentsStage>[];
      json['students'].forEach((v) {
        students!.add(StudentsStage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['stage_id'] = stageId;
    data['stage_name'] = stageName;
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentsStage {
  int? id;
  String? name;
  String? year;
  double? avgEvaluation;

  StudentsStage({this.id, this.name, this.year, this.avgEvaluation});

  StudentsStage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    avgEvaluation = json['avg_evaluation'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['year'] = year;
    data['avg_evaluation'] = avgEvaluation;
    return data;
  }
}
