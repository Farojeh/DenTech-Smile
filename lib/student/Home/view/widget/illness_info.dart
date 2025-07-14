import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class IllnessInfo extends StatelessWidget {
  const IllnessInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Static.getwieght(context, 35),
          top: Static.gethieght(context, 10)),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 163 / 31,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(4, (index) {
          return Container(
            height: Static.gethieght(context, 31),
            width: Static.getwieght(context, 163),
            alignment: Alignment.center,
            child: Row(
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
                  "Diabetes",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 17)),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
