import 'package:dentech_smile/student/learning/views/widget/artical_text.dart';
import 'package:dentech_smile/student/learning/views/widget/auther_time.dart';
import 'package:dentech_smile/student/learning/views/widget/image_articale.dart';
import 'package:dentech_smile/student/learning/views/widget/title_artical.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainArticale extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String time;
  final String artical;
  final bool isimage;
  const MainArticale(
      {super.key,
      required this.image,
      required this.title,
      required this.author,
      required this.artical,
      required this.time,
      required this.isimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.035,
          top: MediaQuery.of(context).size.width * 0.12),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.925,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 0.5, color: Colors.black45),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ImageArtical(
                image: image,
                isimage: isimage,
              ),
              TitleArtical(title: title),
              AutherTime(auther: author, time: time),
              ArticalText(artical: artical)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 9),
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                )),
          )
        ],
      ),
    );
  }
}
