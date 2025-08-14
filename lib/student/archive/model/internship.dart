import 'package:dentech_smile/student/archive/model/achive.dart';

class Internship {
  final String id;
  final String name;
  final List<Archive> archives; // قائمة الأرشيفات المرتبطة

  Internship({
    required this.id,
    required this.name,
    required this.archives,
  });

  static Internship setdata(int type, Map<String, dynamic> json) {
    return Internship(
      id: json["stage_id"].toString(),
      name: json["stage_name"],
      archives: (json['educational_contents'] as List?)
              ?.map((p) => Archive.setdata(type, p))
              .toList() ??
          [],
    );
  }
}
