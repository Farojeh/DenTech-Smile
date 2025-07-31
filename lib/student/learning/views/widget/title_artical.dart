import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TitleArtical extends StatelessWidget {
  final String title ;
  const TitleArtical({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(top: 10 , left: 10),
              height: MediaQuery.of(context).size.height*0.045,
              width: MediaQuery.of(context).size.width,
              child: Text(title , style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                wordSpacing: 3,
                letterSpacing: 0.4,
                color: Colors.black, 
                fontFamily: Static.arialRoundedMTfont,
              ),),
             );
  }
}