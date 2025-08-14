class Archive {
  final int id;
  final String tag;
  final String patient;
  final String internship;
  final double rate;
  final bool isimage;

  Archive(
      {this.isimage = false,
      required this.id,
      required this.tag,
      required this.patient,
      required this.internship,
      required this.rate});

  static Archive setdata(int type, Map<String, dynamic> json) {
    if (type == 1 || type == 2) {
      return Archive(
          id: json["content_id"],
          tag: "null",
          patient: json["title"],
          internship: json["supervisor_name"],
          rate: (json["appropriate_rating"] as num?)?.toDouble() ?? 0.0);
    } else {
      List<String> images =
          (json["images"] as List?)?.map((e) => e.toString()).toList() ?? [];
      return Archive(
        isimage:images.isEmpty ? false : true,
        id: json["content_id"],
        tag: images.isEmpty ? "null" : images[0],
        patient: json["title"],
        internship: json["supervisor_name"],
        rate: (json["appropriate_rating"] as num?)?.toDouble() ?? 0.0,
      );
    }
  }

    static Archive setdatafromarchive(Map<String, dynamic> json) {
    return Archive(
          id: json["session_id"],
          tag: "null",
          patient: json["patient"]["name"],
          internship: json["date"],
          rate: (json["evaluation_score"] as num?)?.toDouble() ?? 0.0);
  }

}
