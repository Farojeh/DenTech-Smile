
class OralDoctorModel {
  String? status;
  List<Students>? students;

  OralDoctorModel({this.status, this.students});

  OralDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
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

class Students {
  int? id;
  String? name;
  String? year;
  String? profileImage;
  double avgEvaluation = 0.0 ;

  Students(
      {this.id, this.name, this.year, this.profileImage, required this.avgEvaluation});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    profileImage = json['profile_image'] ?? '';
    avgEvaluation = (json['avg_evaluation']) == null ? 0.0 : (json['avg_evaluation']).toDouble() ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['year'] = year;
    data['profile_image'] = profileImage;
    data['avg_evaluation'] = avgEvaluation;
    return data;
  }
}