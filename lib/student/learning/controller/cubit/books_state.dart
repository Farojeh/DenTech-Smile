part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}
final class BooksSuccess extends BooksState {
  final String path ;

  BooksSuccess({required this.path});
}
final class BooksLoading extends BooksState {}
final class Booksfailure extends BooksState {
  final String errormessage;

  Booksfailure({required this.errormessage});
}
