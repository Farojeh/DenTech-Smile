import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:flutter/material.dart';

class BeforGeneral extends StatelessWidget {
  final String image;
  final String title;
  final List<String> images;
  const BeforGeneral(
      {super.key,
      required this.images,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitle(
          image: image,
          title: title,
          more: "",
          ismore: false,
        ),
        Container(
            height: Static.gethieght(context, 100),
            margin: EdgeInsets.only(
              left: Static.getwieght(context, 40),
              top: Static.gethieght(context, 25),
              bottom: Static.gethieght(context, 30),
            ),
            child: images.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) => InkWell(
                          overlayColor: MaterialStatePropertyAll(
                              Colors.white.withOpacity(0)),
                          onTap: () =>
                              Static.showimage(context, images[index], false),
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: Static.gethieght(context, 100),
                            width: Static.getwieght(context, 109),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${Static.urlimagewithoutstorage}${images[index]}",
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ))
                : Center(
                    child: Text(
                      "No Images yet",
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400,
                          color: Static.lightcolor2,
                          fontSize: 16),
                    ),
                  )),
      ],
    );
  }
}
