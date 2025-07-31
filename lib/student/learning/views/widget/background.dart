import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class background extends StatelessWidget {
  final String image;
  final bool isimage;
  const background({super.key, required this.image, required this.isimage});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: isimage
              ? Image.network(
                  "${Static.urlimage}$image" , fit: BoxFit.cover,)
              : Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
    );
  }
}



// CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/$img"