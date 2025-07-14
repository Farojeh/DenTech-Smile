import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String image;
  final String title;
  final String more;
  final bool ismore ;
  final double? horizontal;
  final void Function()? onTapfun;
  const CustomTitle(
      {super.key,
      required this.image,
      required this.title,
      required this.more, required this.ismore, this.onTapfun, this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            image,
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: Static.arialRoundedMTfont,
                fontSize: Static.getwieght(context, 18),
                color: Colors.black),
          ),
          const Spacer(),
         ismore? InkWell(
          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
          onTap:onTapfun ,
           child: Text(
              more,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: Static.afacadfont,
                  fontSize: Static.getwieght(context, 16),
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
         ): const SizedBox()
        ],
      ),
    );
  }
}
