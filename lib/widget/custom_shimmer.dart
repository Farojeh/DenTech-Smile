import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class Shimmergym extends StatelessWidget {
  final double height;
  final double width ;
  final double radius;
  final Color? cc  ; 
  final EdgeInsetsGeometry? margin ;

  // ignore: non_constant_identifier_names
  const Shimmergym.Rectangle({super.key, 
    required this.height,
    required this.width,
    required this.radius,
    required this.cc,
    required this.margin
  });


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
       baseColor: cc!,
       highlightColor:Colors.grey[200]! ,
       child: Container(
        margin:margin ,
        height: height,
        width: width,
       // color: Colors.grey[400]!,
        decoration: ShapeDecoration(
          color:Colors.grey[300]!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))
          )),
       )
       );
  }
}