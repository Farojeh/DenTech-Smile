import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:flutter/material.dart';

class XRayWidget extends StatelessWidget {
  final String image;
  const XRayWidget({super.key, required this.image});

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
          onTap: () => Static.showimage(context,image, false),
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Static.getwieght(context, 40),
                vertical: Static.gethieght(context, 25)),
            height: Static.gethieght(context, 215),
            width: Static.getwieght(context, 323),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "${Static.urlimagewithoutstorage}$image",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
