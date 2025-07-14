import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:flutter/material.dart';

class XRayWidget extends StatelessWidget {
  const XRayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomTitle(
          image: "assets/images/x-rays.png",
          title: "X-ray Image",
          more: " ",
          ismore: false,
        ),
        InkWell(
          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
          onTap: () => Static.showimage(context, "assets/images/OIP.png"),
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Static.getwieght(context, 40),
                vertical: Static.gethieght(context, 25)),
            height: Static.gethieght(context, 215),
            width: Static.getwieght(context, 323),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/OIP.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
