import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/archive/controller/cubit/archive_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class ArchiveList extends StatelessWidget {
  const ArchiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15),
      child: BlocBuilder<ArchiveCubit, ArchiveState>(
        builder: (context, state) {
          if (state is ArchiveSuccess) {
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
                                onTap: () => GoRouter.of(context)
                                    .push(AppRouter.stategeneral, extra: {
                                  "name": e.internship,
                                  "patient": e.patient,
                                  "rate": e.rate
                                }),
                                child: Container(
                                  height: Static.gethieght(context, 90),
                                  width: Static.getwieght(context, 362),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color:
                                              Colors.black.withOpacity(0.25)),
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
                                            color:
                                                Colors.black.withOpacity(0.25)),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "# ${e.tag}",
                                        style: TextStyle(
                                            fontFamily: Static.afacadfont,
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                Static.getwieght(context, 35),
                                            color: Colors.black),
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
                                                    context, 17),
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
                                                fontSize: Static.getwieght(
                                                    context, 15)),
                                          ),
                                          const SizedBox(
                                            height: 2.5,
                                          ),
                                          RatingBarIndicator(
                                            rating: e.rate,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rate_rounded,
                                              color: Color(0xffE6CD0D),
                                            ),
                                            itemCount: 5,
                                            itemSize: 15,
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
                              "No Emergencies In This Internship",
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
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
