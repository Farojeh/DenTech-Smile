part of 'on_boarding_cubit.dart';

@immutable
class OnBoardingState {
  final int selectPage;
  final List pageArray = [
    {
      "title": "Book your appointment easily",
      "artitle": "احجز موعدك بسهولة و سرعة",
      "subtitle":
          "Schedule all your appointments accurately and easily",
      "arsubtitle":
          "احجز جميع مواعيدك من المنزل بدقة وسهولة ",
      "image": "assets/images/pg1.png",
    },
    {
      "title": "Reviews and comments build your future",
      "artitle": "الملاحظات والاراء تبني مستقبلك",
      "subtitle": "The professor will easily evaluate you, and through this evaluation you can create a wonderful portfolio.",
       "arsubtitle":
          " سيقوم استاذك الجامعي بتقييمك بسهولة ومن خلال هذا التقييم سيكون لك معرض الأعمال الخاص بك",
      "image": "assets/images/pg2.png",
    },
    {
      "title": "Learning community",
      "artitle": "المجتمع التعليمي",
      "subtitle":
          "A forum for discussions, questions, sharing experiences, and practical lessons and notes on all internships.",
       "arsubtitle":
           "منتدى رائع للنقاشات والأسئلة وتبادل الخبرات والدروس العملية والملاحظات حول كافة التدريبات",
     "image": "assets/images/pg3.png",
    },
    {
      "title": "Save your money and tools ",
      "artitle": "وفر المال والادوات ",
      "subtitle":
          "A dedicated section to display your no longer needed tools and books for younger students to use. Save time and money and help others.",
       "arsubtitle":
          " قسم مخصص لعرض أدواتك وكتبك التي لم تعد بحاجة إليها ليستخدمها الطلاب الأصغر سنًا. وفر وقتك ومالك وساعد الآخرين.",
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
