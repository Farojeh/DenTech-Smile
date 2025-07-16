import 'package:dentech_smile/student/portfolio/model/case.dart';

class PortfolioIntership{
  final String name ;
  final int degree ;
  final int total ;
  final List<Case> cases ;

  PortfolioIntership({required this.name, required this.degree, required this.total, required this.cases});
}