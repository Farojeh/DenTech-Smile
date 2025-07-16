import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopPortfolio extends StatelessWidget {
  const TopPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 95,
          width: 105,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 85,
                    width: 90,
                    color: Colors.black,
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black)),
                    child: Image.asset(
                      "assets/images/student.jpg",
                      height: 85,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ))
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Areej Mahfouz",
                style: TextStyle(
                    fontFamily: Static.arialRoundedMTfont,
                    fontSize: Static.getwieght(context, 22),
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Dentistry University",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w400,
                    fontSize: Static.getwieght(context, 16),
                    color: Colors.black),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Fourth academic year",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w400,
                    fontSize: Static.getwieght(context, 16),
                    color: Colors.black),
              ),
              const SizedBox(
                height: 4,
              ),
              RatingBarIndicator(
                rating: 3.5,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xffE6CD0D),
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              )
            ],
          ),
        )
      ],
    );
  }
}
