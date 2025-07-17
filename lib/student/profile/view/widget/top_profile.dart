import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/view/widget/image_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopProfile extends StatelessWidget {
  const TopProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Static.gethieght(context, 304),
      width: Static.getwieght(context, 278),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageProfile(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Areej Mahfouz",
            style: TextStyle(
                fontFamily: Static.arialRoundedMTfont,
                fontSize: 28,
                color: Colors.white),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            "Fourth academic year",
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.center,
            height: Static.gethieght(context, 39),
            width: Static.getwieght(context, 156),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: RatingBarIndicator(
              rating: 3.5,
              itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Color.fromARGB(255, 229, 208, 49)),
              itemCount: 5,
              itemSize: 21,
              direction: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
