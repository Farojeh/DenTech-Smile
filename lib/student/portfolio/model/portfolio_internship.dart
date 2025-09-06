import 'package:dentech_smile/student/portfolio/model/case.dart';

class PortfolioIntership{
  final int id ;
  final String name ;
  final double degree ;
  final double total ;
  final List<Case> cases ;

  PortfolioIntership({required this.id,required this.name, required this.degree, required this.total, required this.cases});

 static PortfolioIntership setdata(Map<String,dynamic> map) {
    return PortfolioIntership(
      id: map['stage_id'],
      name: map['stage_name'],
      degree:map["stage_average_evaluation"]==null?0.0: degreefun(map["stage_average_evaluation"].toString()),
      total: 5,
      cases: (map['patients'] as List)
          .map((p) => Case.setdata(p))
          .toList(),
    );
  }

  static double degreefun(String? number){
    if(number == null){
      return 0.0 ;
    }else{
      return num.parse(number).toDouble();
    }
  }

}