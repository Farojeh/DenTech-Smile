import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ResourceTitle extends StatelessWidget {
  final String name ;
  final String image;
  const ResourceTitle({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
           const SizedBox(width: 20,),
            Image.asset(image,
            height: Static.gethieght(context, 35),
            width: Static.gethieght(context, 35),
            fit: BoxFit.contain,
            ),
           const  SizedBox(width: 10,),
            Text(name , style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 21
            ),)
          ],
        );
  }
}