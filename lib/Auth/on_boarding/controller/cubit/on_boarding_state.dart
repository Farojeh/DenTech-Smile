part of 'on_boarding_cubit.dart';

@immutable
class OnBoardingState {
  final int selectPage;
  final List pageArray = [
    {
      "title": "Book your appointment easily",
      "subtitle":
          "Schedule all your appointments accurately and easily",
      "image": "assets/images/pg1.png",
    },
    {
      "title": "Reviews and comments build your future",
      "subtitle": "The professor will easily evaluate you, and through this evaluation you can create a wonderful portfolio.",
      "image": "assets/images/pg2.png",
    },
    {
      "title": "Learning community",
      "subtitle":
          "A forum for discussions, questions, sharing experiences, and practical lessons and notes on all internships.",
      "image": "assets/images/pg3.png",
    },
    {
      "title": "Save your money and tools ",
      "subtitle":
          "A dedicated section to display your no longer needed tools and books for younger students to use. Save time and money and help others.",
      "image": "assets/images/pg4.png",
    },
  ];


   OnBoardingState({this.selectPage = 0});

  OnBoardingState copyWith({int? selectPage, double? percent}) {
    return OnBoardingState(
      selectPage: selectPage ?? this.selectPage,
    );
  }
}
