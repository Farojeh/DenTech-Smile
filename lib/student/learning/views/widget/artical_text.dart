import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ArticalText extends StatelessWidget {
  final String artical;
  const ArticalText({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.52,
      child: Scrollbar(
        thickness: 6.0,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 30, top: 10),
            child: Text(
              artical,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.044,
                color: const Color.fromARGB(255, 34, 33, 33),
                fontWeight: FontWeight.w400,
                fontFamily: Static.afacadfont,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
