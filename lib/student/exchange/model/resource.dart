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

 static Resource setdata(Map<String,dynamic> json){
  return Resource(name: json["resource_name"],
   id: json["id"],
    image: json["image_path"],
     type: json["category"],
      startdate:json["loan_start_date"] ?? "none",
       enddate: json["loan_end_date"]??"none");
 }

 static Resource setdata2(Map<String,dynamic> json){
  return Resource(name: json["resource_name"],
   id: json["id"],
    image: json["image_path"],
     type: json["category"],
     status: json["status"]=="available"?false:true,
      startdate:json["loan_start_date"] ?? "none",
       enddate: json["loan_end_date"]??"none");
 }

}
