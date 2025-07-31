part of 'youtubecontent_cubit.dart';

@immutable
sealed class YoutubecontentState {}

final class YoutubecontentInitial extends YoutubecontentState {}
final class YoutubecontentSuccess extends YoutubecontentState {
  final String path ;

  YoutubecontentSuccess({required this.path});
}
final class YoutubecontentLoading extends YoutubecontentState {}
final class Youtubecontentfailure extends YoutubecontentState {
  final String errormessage ;

  Youtubecontentfailure({required this.errormessage});
}
