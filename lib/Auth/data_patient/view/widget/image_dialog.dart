import 'dart:io';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final File image;
  const ImageDialog({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.47,
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Are you sure you want to add this image?",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin:const EdgeInsets.only(top: 20, bottom: 20),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 0.2, color: Colors.black45)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(image, fit: BoxFit.cover),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Static.basiccolor,
                        height: 40,
                        width: 70,
                        redbl: 10,
                        redbr: 10,
                        redtl: 10,
                        redtr: 10,
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                    const SizedBox(
                      width: 27,
                    ),
                    CustomButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        color: Static.basiccolor,
                        height: 40,
                        width: 70,
                        redbl: 10,
                        redbr: 10,
                        redtl: 10,
                        redtr: 10,
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                  ],
                )
              ],
            )));
  }
}
