import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/portfolio/model/portfolio_internship.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CaseWidget extends StatelessWidget {
  final PortfolioIntership e;
  const CaseWidget({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 20, left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: e.cases.length,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(right: 20),
                height: 81,
                width: 132,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: const Color(0xff8B8B8B))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.cases[index].patient,
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: Static.getwieght(context, 17)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${e.cases[index].num} Therapy sessions",
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: Static.getwieght(context, 16)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RatingBarIndicator(
                      rating: e.cases[index].rate,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rate_rounded,
                        color: Color(0xffE6CD0D),
                      ),
                      itemCount: 5,
                      itemSize: 16,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              )),
    );
  }
}
