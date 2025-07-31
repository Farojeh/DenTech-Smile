import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ImageArtical extends StatelessWidget {
  final String image;
  final bool isimage ;
  const ImageArtical({super.key, required this.image, required this.isimage});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.26,
        width: MediaQuery.of(context).size.width * 0.925,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(100))),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(100)),
            child:isimage
              ? Image.network(
                  "${Static.urlimage}$image" , fit: BoxFit.cover,)
              : Image.asset(
                  image,
                  fit: BoxFit.cover,
                )));
  }
}
