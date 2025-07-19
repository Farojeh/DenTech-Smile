import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/waveclipper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopState extends StatelessWidget {
  final String name;
  final String start;
  final String end;
  const TopState(
      {super.key, required this.name, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Static.gethieght(context, 250),
          width: MediaQuery.of(context).size.width,
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: Static.gethieght(context, 245),
            width: MediaQuery.of(context).size.width,
            color: Colors.black87,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/images/state.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            left: Static.getwieght(context, 15),
            top: MediaQuery.of(context).padding.top + 10,
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffBEBEBE).withOpacity(0.24),
                    border: Border.all(
                        width: 0.5, color: Colors.white.withOpacity(0.51))),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )),
        Positioned(
            left: Static.getwieght(context, 70),
            top: MediaQuery.of(context).padding.top + 13,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w500,
                  fontSize: Static.getwieght(context, 25),
                  color: Colors.white),
            )),
        Positioned(
            right: Static.getwieght(context, 90),
            bottom: Static.getwieght(context, 30),
            child: Text(
              "[ $start ] [ $end ]",
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w400,
                  fontSize: Static.getwieght(context, 17),
                  color: Colors.black),
            )),
      ],
    );
  }
}
