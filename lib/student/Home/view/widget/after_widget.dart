import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:flutter/material.dart';

class AfterWidget extends StatefulWidget {
  const AfterWidget({super.key});

  @override
  State<AfterWidget> createState() => _AfterWidgetState();
}

class _AfterWidgetState extends State<AfterWidget> {
  List<String> imges = [
    "assets/images/test3.jpg",
    "assets/images/test4.jpg",
    "assets/images/test5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitle(
          image: "assets/images/after.png",
          title: "After treatment",
          more: "add image",
          ismore: true,
          onTapfun: () async {
            bool result = await Static.pickeimage(context);
            if (result) {
              if (!context.mounted) return;
              print("image exist");
              // BlocProvider.of<MedicanCubit>(context)
              //       .addimagetolist();
            }
          },
        ),
        Container(
          height: Static.gethieght(context, 100),
          margin: EdgeInsets.only(
            left: Static.getwieght(context, 40),
            top: Static.gethieght(context, 25),
            bottom: Static.gethieght(context, 30),
          ),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imges.length,
              itemBuilder: (context, index) => InkWell(
                    overlayColor:
                        MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                    onTap: () => Static.showimage(context, imges[index]),
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: Static.gethieght(context, 100),
                      width: Static.getwieght(context, 109),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imges[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
