import 'dart:io';

import 'package:dentech_smile/Auth/data_patient/view/widget/image_dialog.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/student/Home/view/widget/show_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class Static {
  static String abhayaLibrefont = "AbhayaLibre";
  static String afacadfont = "Afacad";
  static String arialRoundedMTfont = "ArialRoundedMT";
  static Color basiccolor = Color(0xff006A71);
  static Color lightcolor = Color(0xff353535);
  static Color lightcolor2 = Color(0xff7C7979);
  static String ipconfig = "192.168.37.207";
  static String userName = "userName";
  static String userNumber = "userNumber";
  static String userPassword = "userPassword";
  static String userRole =
      "userRole"; //2 for patient , 1 for student , 4 for doctor
  static String token = "Token";

  static void home(BuildContext context) {
    if (userInfo!.getInt(userRole) == 1) {
      GoRouter.of(context).pushReplacement(AppRouter.studenthome);
    } else if (userInfo!.getInt(userRole) == 2) {
      GoRouter.of(context).pushReplacement(AppRouter.datapatient);
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.professor);
    }
  }

  static double gethieght(BuildContext context, double size) {
    return (MediaQuery.of(context).size.height / 932) * size;
  }

  static double getwieght(BuildContext context, double size) {
    return (MediaQuery.of(context).size.width / 430) * size;
  }

  static void showimage(BuildContext context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Showimage(imagePath: path),
      ),
    );
  }

 static Future<bool> pickeimage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? image;
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
    }

    if (!context.mounted) return false;

    if (image != null) {
      bool? result = await showDialog(
        context: context,
        builder: (context) => ImageDialog(image: File(image!.path)),
      );
      return result ?? false;
    }
    return false;
  }
}
