import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ArchiveInternship extends StatelessWidget {
  const ArchiveInternship({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 5),
      height: Static.gethieght(context, 45),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                // onTap: () => cubit.selectday(index),
                child: Container(
                  height: Static.gethieght(context, 45),
                  width: Static.getwieght(context, 137),
                  margin: EdgeInsets.only(right: Static.getwieght(context, 13)),
                  decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xff325060)
                          : const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    "Tooth extraction",
                    style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwieght(context, 16),
                        color: index == 0 ? Colors.white : Static.lightcolor2),
                  ),
                ),
              )),
    );
  }
}
