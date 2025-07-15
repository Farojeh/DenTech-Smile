import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/archive/model/achive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArchiveList extends StatefulWidget {
  const ArchiveList({super.key});

  @override
  State<ArchiveList> createState() => _ArchiveListState();
}

class _ArchiveListState extends State<ArchiveList> {
  List<Archive> archives = [
    Archive(
        tag: "A",
        patient: "Aleen Morad ",
        internship: "Tooth extraction InternShip",
        rate: 3),
    Archive(
        tag: "A",
        patient: "Aleen Morad ",
        internship: "Tooth extraction InternShip",
        rate: 3),
    Archive(
        tag: "A",
        patient: "Aleen Morad ",
        internship: "Tooth extraction InternShip",
        rate: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: archives
                .map((e) => InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                      // onTap: () => GoRouter.of(context)
                      //     .push(AppRouter.statePage, extra: {
                      //   "name": e.internship,
                      //   "start": e.start,
                      //   "end": e.end
                      // }),
                      child: Container(
                        height: Static.gethieght(context, 90),
                        width: Static.getwieght(context, 362),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.black.withOpacity(0.25)),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.only(bottom: 18),
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: Static.gethieght(context, 70),
                            width: Static.getwieght(context, 80),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.black.withOpacity(0.25)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "# ${e.tag}",
                              style: TextStyle(
                                  fontFamily: Static.afacadfont,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Static.getwieght(context, 35),
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 13, bottom: 2, top: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.patient,
                                  style: TextStyle(
                                      fontFamily: Static.arialRoundedMTfont,
                                      fontSize: Static.getwieght(context, 17),
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 2.5,
                                ),
                                Text(
                                  e.internship,
                                  style: TextStyle(
                                      fontFamily: Static.afacadfont,
                                      fontWeight: FontWeight.w400,
                                      color: Static.lightcolor,
                                      fontSize: Static.getwieght(context, 15)),
                                ),
                                const SizedBox(
                                  height: 2.5,
                                ),
                                RatingBar.builder(
                                  onRatingUpdate: (value) {},
                                  initialRating: e.rate,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_rate_rounded,
                                    color: Color(0xffE6CD0D),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
