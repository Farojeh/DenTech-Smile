class Case {
  final int id;
  final String patient;
  final int num;

  Case({required this.id, required this.patient, required this.num});

 static Case setdata(Map<String, dynamic> map) {
    return Case(
        id: map["patient_id"], patient: map["name"], num: map["session_count"]);
  }
}
