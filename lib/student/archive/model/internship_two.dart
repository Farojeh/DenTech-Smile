import 'package:dentech_smile/student/archive/model/archive_two.dart';

class InternshipTwo {
  final String id;
  final String name;
  final List<ArchiveTwo> archives;

  InternshipTwo({
    required this.id,
    required this.name,
    required this.archives,
  });

  static InternshipTwo setdatafromarchive(Map<String, dynamic> json) {
    return InternshipTwo(
      id: json["stage_id"].toString(),
      name: json["stage_name"],
      archives: (json['archived_sessions'] as List?)
              ?.map((p) => ArchiveTwo.setdatafromarchive(p, json["stage_name"]))
              .toList() ??
          [],
    );
  }
}
