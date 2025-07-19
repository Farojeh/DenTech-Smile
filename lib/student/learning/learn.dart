import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class Learnpage extends StatelessWidget {
  const Learnpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/learn_backgroundcopy.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 15,
            child: Row(
              children: [
                Container(
                  height: Static.gethieght(context, 44),
                  width: Static.gethieght(context, 44),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.51), width: 0.5),
                      color: const Color(0xffBEBEBE).withOpacity(0.24)),
                  padding: const EdgeInsets.all(10.5),
                  child: Image.asset("assets/images/arrow_back_white.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  " Learning community ",
                  style: TextStyle(
                      fontFamily: Static.arialRoundedMTfont,
                      color: Colors.white,
                      fontSize: Static.getwieght(context, 24)),
                )
              ],
            )),
        Positioned(
            bottom: Static.gethieght(context, 180),
            left: Static.getwieght(context, 32),
            child: SizedBox(
              height: Static.gethieght(context, 142),
              width: Static.getwieght(context, 191),
              child: Image.asset(
                "assets/images/youtube.png",
                fit: BoxFit.contain,
              ),
            )),
        Positioned(
            top: Static.gethieght(context, 200),
            left: Static.getwieght(context, 48),
            child: SizedBox(
              height: Static.gethieght(context, 75),
              width: Static.getwieght(context, 257),
              child: Image.asset(
                "assets/images/references.png",
                fit: BoxFit.contain,
              ),
            )),
        Positioned(
            bottom: Static.gethieght(context, 365),
            right: Static.getwieght(context, 15),
            child: SizedBox(
              height: Static.gethieght(context, 144),
              width: Static.getwieght(context, 191),
              child: Image.asset(
                "assets/images/scientific.png",
                fit: BoxFit.contain,
              ),
            )),
      ],
    ));
  }
}
