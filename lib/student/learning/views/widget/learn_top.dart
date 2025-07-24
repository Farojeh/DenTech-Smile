import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearnTop extends StatelessWidget {
  final String title;
  const LearnTop({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
      ),
      child: Row(
        children: [
          InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: () => GoRouter.of(context).pop(),
            child: Container(
              alignment: Alignment.center,
              height: Static.gethieght(context, 44),
              width: Static.gethieght(context, 44),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black.withOpacity(0.51), width: 0.8),
                  color: const Color(0xff515151).withOpacity(0.24)),
              child:const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            " $title",
            style: TextStyle(
                fontFamily: Static.arialRoundedMTfont,
                color: Colors.black,
                fontSize: Static.getwieght(context, 24)),
          )
        ],
      ),
    );
  }
}
