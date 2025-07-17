import 'dart:io';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  String? imageprofile = userInfo!.getString(Static.studentimage);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Static.gethieght(context, 160),
      width: Static.gethieght(context, 145),
      child: Stack(
        children: [
          Container(
            height: Static.gethieght(context, 145),
            width: Static.gethieght(context, 145),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: ClipOval(
              child: imageprofile == null
                  ? Image.asset(
                      "assets/images/student.jpg",
                      fit: BoxFit.cover,
                      height: 145,
                      width: 145,
                    )
                  : Image.file(File(imageprofile!), fit: BoxFit.cover),
            ),
          ),
          Positioned(
              right: 10,
              bottom: 8,
              child: InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                onTap: () async {
                  String? result = await Static.pickeimageprofile(context);
                  if (result != null) {
                    setState(() {
                      imageprofile = result;
                    });
                    userInfo!.setString(Static.studentimage, result);
                  }
                },
                child: Container(
                    height: Static.gethieght(context, 40),
                    width: Static.gethieght(context, 40),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 0.5, color: Colors.black)),
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      "assets/images/edit-image (1) 1.png",
                      fit: BoxFit.contain,
                    )),
              ))
        ],
      ),
    );
  }
}
