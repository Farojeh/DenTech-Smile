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

  static ArchiveTwo setdatafromarchive(Map<String, dynamic> json, String inter) {
  List session = (json['session_images'] as List? ?? []);

  List<String> beforimage = [];
  List<String> afterimage = [];

  if (session.isNotEmpty) {
    beforimage = session
        .where((item) => item['type'] == 'before-treatment')
        .map((item) => item['image_url'] as String)
        .toList();

    afterimage = session
        .where((item) => item['type'] == 'after-treatment')
        .map((item) => item['image_url'] as String)
        .toList();
  }

  // ✅ fix radiology_images
  String? xrayImageUrl;
  var radiology = (json['radiology_images'] as List? ?? []);
  var xray = radiology.cast<Map<String, dynamic>>().firstWhere(
        (item) => item['type'] == 'x-ray',
        orElse: () => {},
      );
  if (xray.containsKey('image_url')) {
    xrayImageUrl = xray['image_url'] as String?;
  }

  // ✅ fix patient nullable
  var patient = json["patient"] ?? {};
  String patientName = patient["name"] ?? "Unknown";
  int patientId = patient["id"] ?? 0;

  return ArchiveTwo(
    patientid: patientId,
    tag: patientName.isNotEmpty ? patientName.substring(0, 1) : "?",
    patient: patientName,
    internship: inter,
    rate: (json["evaluation_score"] as num?)?.toDouble() ?? 0.0,
    description: json["description"] ?? "",
    supervisorcomments: json["supervisor_comments"] ?? "",
    befor: beforimage,
    after: afterimage,
    xrayimage: xrayImageUrl ?? "",
  );
}
}
