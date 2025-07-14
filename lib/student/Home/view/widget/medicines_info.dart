import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class MedicinesInfo extends StatefulWidget {
  const MedicinesInfo({super.key});

  @override
  State<MedicinesInfo> createState() => _MedicinesInfoState();
}

class _MedicinesInfoState extends State<MedicinesInfo> {
  List<String> imges = [
    "assets/images/test3.jpg",
    "assets/images/test4.jpg",
    "assets/images/test5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Static.gethieght(context, 90),
      margin: EdgeInsets.only(
        left: Static.getwieght(context, 30),
        top: Static.gethieght(context, 15),
        bottom: Static.gethieght(context, 10),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imges.length,
          itemBuilder: (context, index) => InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                onTap: () => Static.showimage(context, imges[index]),
                child: Container(
                  margin: const EdgeInsets.only(right: 7),
                  height: Static.gethieght(context, 90),
                  width: Static.getwieght(context, 90),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imges[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
    );
  }
}
