class PracticalModel {
  String? status;
  int? scheduleId;
  String? day;
  String? location;
  int? supervisorId;
  int? stageId;
  String? stageName;
  List<StudentsPractical>? students;

  PracticalModel({
    this.scheduleId,
    this.day,
    this.status,
    this.location,
    this.supervisorId,
    this.stageId,
    this.stageName,
    this.students,
  });

  PracticalModel.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    status = json['status'];
    day = json['day'];
    location = json['location'];
    supervisorId = json['supervisor_id'];
    stageId = json['stage_id'];
    stageName = json['stage_name'];
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students!.add(StudentsPractical.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['schedule_id'] = scheduleId;
    data['day'] = day;
    data['location'] = location;
    data['supervisor_id'] = supervisorId;
    data['stage_id'] = stageId;
    data['stage_name'] = stageName;
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentsPractical {
  int? studentId;
  String? name;
  String? profileImageUrl;
  String? year;
  int? groupNumber;

  StudentsPractical({
    this.studentId,
    this.name,
    this.profileImageUrl,
    this.year,
    this.groupNumber,
  });

  StudentsPractical.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    name = json['name'];
    profileImageUrl = json['profile_image_url'];
    year = json['year'];
    groupNumber = json['group_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['name'] = name;
    data['profile_image_url'] = profileImageUrl;
    data['year'] = year;
    data['group_number'] = groupNumber;
    return data;
  }
}
