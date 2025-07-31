part of 'portfolio_cubit.dart';

@immutable
sealed class PortfolioState {}

final class PortfolioInitial extends PortfolioState {}
final class PortfolioLoading extends PortfolioState {}
final class Portfoliofailure extends PortfolioState {
  final String errormessage ;

  Portfoliofailure({required this.errormessage});
}

final class PortfolioSuccess extends PortfolioState {
  final double totaldegree;
  final List<PortfolioIntership> internship;

  PortfolioSuccess({required this.internship , required this.totaldegree});
}
