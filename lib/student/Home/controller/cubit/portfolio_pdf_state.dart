part of 'portfolio_pdf_cubit.dart';

@immutable
sealed class PortfolioPdfState {}

final class PortfolioPdfInitial extends PortfolioPdfState {}

final class PortfolioPdfLoading extends PortfolioPdfState {}

final class PortfolioPdffailure extends PortfolioPdfState {
  final String errormessage;

  PortfolioPdffailure({required this.errormessage});
}

final class PortfolioPdfSuccess extends PortfolioPdfState {
  final String path;

  PortfolioPdfSuccess({required this.path});
}
