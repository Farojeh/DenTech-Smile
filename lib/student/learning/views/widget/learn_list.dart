import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/learning/controller/cubit/learning_cubit.dart';
import 'package:dentech_smile/student/learning/views/widget/artical_dialog.dart';
import 'package:dentech_smile/student/learning/views/widget/book_dialog.dart';
import 'package:dentech_smile/student/learning/views/widget/youtube_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LearnList extends StatelessWidget {
  final int type;
  const LearnList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15),
      child: BlocBuilder<LearningCubit, LearningState>(
        builder: (context, state) {
          if (state is LearningSuccess) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.allarchives.isNotEmpty
                      ? state.allarchives
                          .map((e) => InkWell(
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.white.withOpacity(0)),
                                onTap: () async {
                                  action(context, e.id, e.internship);
                                },
                                child: Container(
                                  height: Static.gethieght(context, 100),
                                  width: Static.getwieght(context, 362),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color:
                                              Colors.black.withOpacity(0.25)),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Row(children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      child: e.isimage
                                          ? Image.network(
                                              "${Static.urlimage}${e.tag}",
                                              height: Static.gethieght(
                                                  context, 100),
                                              width: Static.getwieght(
                                                  context, 103),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              setimage(e.tag),
                                              height: Static.gethieght(
                                                  context, 100),
                                              width: Static.getwieght(
                                                  context, 103),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 13, bottom: 2, top: 2),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.patient,
                                            style: TextStyle(
                                                fontFamily:
                                                    Static.arialRoundedMTfont,
                                                fontSize: Static.getwieght(
                                                    context, 18),
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Dr.${e.internship}",
                                            style: TextStyle(
                                                fontFamily: Static.afacadfont,
                                                fontWeight: FontWeight.w400,
                                                color: Static.lightcolor,
                                                fontSize: Static.getwieght(
                                                    context, 16)),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RatingBarIndicator(
                                            rating: e.rate,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rate_rounded,
                                              color: Color(0xffE6CD0D),
                                            ),
                                            itemCount: 5,
                                            itemSize: 17,
                                            direction: Axis.horizontal,
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ))
                          .toList()
                      : [
                          Container(
                            margin: EdgeInsets.only(
                                left: Static.getwieght(context, 30),
                                right: 80,
                                top: 70),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/File searching-rafiki.png",
                              height: 250,
                              width: 250,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Static.getwieght(context, 50)),
                            child: Text(
                              "No Content In This Internship",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: Static.afacadfont,
                                  fontWeight: FontWeight.w400,
                                  fontSize: Static.getwieght(context, 18),
                                  color: const Color(0xff325060)),
                            ),
                          )
                        ]),
            );
          } else if (state is LearningLoading) {
            return Static.loading();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  String setimage(String image) {
    if (type == 3) {
      if (image == "null") {
        return "assets/images/article.jpg";
      } else {
        return image;
      }
    } else if (type == 2) {
      return "assets/images/youtube.jpg";
    } else {
      return "assets/images/book.jpg";
    }
  }

  void action(BuildContext context, int id, String auther) {
    if (type == 2) {
      showDialog(
        context: context,
        builder: (context) => YoutubeDialod(
          id: id,
        ),
      );
    } else if (type == 3) {
      showDialog(
        context: context,
        builder: (context) => ArticalDialog(
          id: id,
          auther: auther,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => BookDialog(
          id: id,
        ),
      );
    }
  }
}
