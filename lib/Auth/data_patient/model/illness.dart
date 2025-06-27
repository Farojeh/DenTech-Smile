class Illness {
  String enname;
  String arname;
  int id;
  bool active;

  Illness(
      {required this.enname,
      required this.arname,
      required this.active,
      required this.id});

  void changeActive() {
    active = !active;
  }

  Illness copyWith({String? enname, String? arname, bool? active, int? id}) {
    return Illness(
      enname: enname ?? this.enname,
      arname: arname ?? this.arname,
      id: id ?? this.id,
      active: active ?? this.active,
    );
  }
}
