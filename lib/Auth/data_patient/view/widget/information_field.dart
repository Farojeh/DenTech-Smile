import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class InformationField extends StatelessWidget {
  final String image;
  final String title;
  final Widget field;
  const InformationField(
      {super.key,
      required this.image,
      required this.title,
      required this.field});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.015,
            ),
            child: Image.asset(
              image,
              height: 35,
              width: 35,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.015,
            ),
            child: Text(title,
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 20,
                    color: Colors.black)),
          ),
          const Spacer(),
          field
        ],
      ),
    );
  }
}
