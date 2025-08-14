class ArchiveTwo {
  final int patientid;
  final String tag;
  final String patient;
  final String internship;
  final double rate;
  final String description;
  final String supervisorcomments;
  final List<String> befor;
  final List<String> after;
  final String xrayimage;

  ArchiveTwo(
      {required this.patientid,
      required this.tag,
      required this.patient,
      required this.internship,
      required this.rate,
      required this.description,
      required this.supervisorcomments,
      required this.befor,
      required this.after,
      required this.xrayimage});

  static ArchiveTwo setdatafromarchive(
      Map<String, dynamic> json, String inter) {
    List session = (json['session_images'] as List? ?? []);
    List<String> beforimage;
    List<String> afterimage;
    if (session.isNotEmpty) {
      beforimage = (json['session_images'] as List? ?? [])
          .where((item) => item['type'] == 'before-treatment')
          .map((item) => item['image_url'] as String)
          .toList();
      afterimage = (json['session_images'] as List? ?? [])
          .where((item) => item['type'] == 'after-treatment')
          .map((item) => item['image_url'] as String)
          .toList();
    } else {
      beforimage = [];
      afterimage = [];
    }
    String? xrayImageUrl = (json['radiology_images'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .firstWhere(
          (item) => item['type'] == 'x-ray',
          orElse: () => {},
        )['image_url'] as String?;
    return ArchiveTwo(
        patientid: json["patient"]["id"],
        tag: json["patient"]["name"].substring(0, 1),
        patient: json["patient"]["name"],
        internship: inter,
        rate: json["evaluation_score"] ?? 0.0,
        description: json["description"]["en"],
        supervisorcomments: json["supervisor_comments"],
        befor: beforimage,
        after: afterimage,
        xrayimage: xrayImageUrl ?? "");
  }
}
