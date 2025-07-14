import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class CustomInfoDialog extends StatelessWidget {
  final String title;
  final String child;
  const CustomInfoDialog({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25 , bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xff46A1A7)),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w400,
                fontSize: Static.getwieght(context, 20),
                color: Colors.black),
          ),
          const Spacer(),
          Text(
            child,
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w400,
                fontSize: Static.getwieght(context, 16),
                color: Color(0xff46A1A7)),
          ),
        ],
      ),
    );
  }
}
