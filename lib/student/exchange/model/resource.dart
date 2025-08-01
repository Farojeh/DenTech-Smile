class Resource {
  final String name;
  final int id;
  final String image;
  final String type;
  final String startdate;
  final String enddate;
  final bool status;

  Resource(
      {required this.name,
      required this.id,
      required this.image,
      required this.type,
      required this.startdate,
      required this.enddate,
      this.status = false
      });

      
}
