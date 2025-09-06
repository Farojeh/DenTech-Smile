import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfessorCaseImage extends StatelessWidget {
  final String? url;
  const ProfessorCaseImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Static.getwidth(context, 90),
      height: Static.getheight(context, 90),
      child: CircleAvatar(
        radius: 15,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: (url == null)
              ? Image.asset('assets/images/doctor.png')
              : Image.network("${Static.urlimagewithoutstorage}$url"),
        ),
      ),
    );
  }
}
