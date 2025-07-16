import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/portfolio/model/case.dart';
import 'package:dentech_smile/student/portfolio/model/portfolio_internship.dart';
import 'package:meta/meta.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial()){
    initialPortfolio();
  }

  void initialPortfolio(){
    List<Case> cases = [
      Case(patient: "Aleen Morad", num: 8, rate: 3),
      Case(patient: "Aleen Morad", num: 8, rate: 3),
      Case(patient: "Aleen Morad", num: 8, rate: 3),
      Case(patient: "Aleen Morad", num: 8, rate: 3),
    ];

    List<PortfolioIntership> internships = [
      PortfolioIntership(name: "Tooth extraction Internship", degree: 35, total: 40, cases: cases),
      PortfolioIntership(name: "Tooth extraction Internship", degree: 35, total: 40, cases: cases),
      PortfolioIntership(name: "Tooth extraction Internship", degree: 35, total: 40, cases: cases),
      PortfolioIntership(name: "Tooth extraction Internship", degree: 35, total: 40, cases: cases)
    ];

    emit(PortfolioSuccess(internship: internships));
  }
}
