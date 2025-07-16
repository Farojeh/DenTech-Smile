part of 'portfolio_cubit.dart';

@immutable
sealed class PortfolioState {}

final class PortfolioInitial extends PortfolioState {}

final class PortfolioSuccess extends PortfolioState {
  final List<PortfolioIntership> internship;

  PortfolioSuccess({required this.internship});
}
