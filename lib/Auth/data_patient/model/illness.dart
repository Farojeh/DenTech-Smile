class Illness {
  String enname;
  String arname ;
  bool active;

  Illness({required this.enname,required this.arname, required this.active});

  void changeActive() {
    active = !active;
  }

  Illness copyWith({String? enname,String? arname, bool? active}) {
    return Illness(
      enname: enname ?? this.enname,
      arname:arname??this.arname ,
      active: active ?? this.active,
    );
  }
}
