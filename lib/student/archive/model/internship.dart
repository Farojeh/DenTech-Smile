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
}
