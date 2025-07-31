import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/portfolio/model/portfolio_internship.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial()) {
    initialPortfolio();
  }

  final apiService = getIt<ApiService>();

  void initialPortfolio() async {
    try {
      emit(PortfolioLoading());
      final response =
          await apiService.get(endPoint: "/portfolio", token: true);

      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Portfoliofailure(errormessage: failure.errorMessage));
        return;
      }

      List<dynamic> stagesJson = response.data["stages"];
      double totaldegree = response.data["overall_grade"];

      List<PortfolioIntership> internships = stagesJson
          .map((stageJson) => PortfolioIntership.setdata(stageJson))
          .toList();
      emit(PortfolioSuccess(internship: internships , totaldegree: totaldegree));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Portfoliofailure(errormessage: failure.errorMessage));
      }
    }
  }
}
