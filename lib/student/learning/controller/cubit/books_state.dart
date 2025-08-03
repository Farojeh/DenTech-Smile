part of 'books_cubit.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksDownloading extends BooksState {
  final int progress;
  BooksDownloading({required this.progress});
}

class BooksSuccess extends BooksState {
  final String path;
  BooksSuccess({required this.path});
}

class Booksfailure extends BooksState {
  final String errormessage;
  Booksfailure({required this.errormessage});
}
