import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/image_dialog.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_dialog.dart';
import 'package:dentech_smile/student/Home/view/widget/show_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'custom_snackbar.dart';

class Static {
  static String abhayaLibrefont = "AbhayaLibre";
  static String afacadfont = "Afacad";
  static String arialRoundedMTfont = "ArialRoundedMT";
  static Color basiccolor = const Color(0xff006A71);
  static Color lightcolor = const Color(0xff353535);
  static Color lightcolor2 = const Color(0xff7C7979);
  static Color? shimmer = Colors.grey[300];
  static String ipconfig = "192.168.125.207";
  static String userName = "userName";
  static String userNumber = "userNumber";
  static String userPassword = "userPassword";
  static String studentyear = "studentyear";
  static String studentid = "studentid";
  static String patientdata = "patientdata";
  static String urlimage = "http://$ipconfig:8000/storage/";
  static String urlimagewithoutsplash = "http://$ipconfig:8000/storage";
  static String userRole =
      "userRole"; //2 for patient , 1 for student , 4 for doctor
  static String token = "Token";
  static String studentimage = "studentimage";

  static void home(BuildContext context) {
    if (userInfo!.getInt(userRole) == 1) {
      GoRouter.of(context).pushReplacement(AppRouter.mainTabView);
    } else if (userInfo!.getInt(userRole) == 2) {
      if (userInfo!.getBool(patientdata) != null &&
          userInfo!.getBool(patientdata)!) {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.datapatient);
      }
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

  static void showimage(BuildContext context, String path, bool? file) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Showimage(
          imagePath: path,
          file: file ?? false,
        ),
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

  static showMyDialog(BuildContext context, String message, int id) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: context.read<PatientCubit>(),
          child: PatientDialog(message: message, id: id),
        );
      },
    );
  }

  static Future<String?> pickeimageprofile(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? image;
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
    }

    if (!context.mounted) return null;

    if (image != null) {
      bool? result = await showDialog(
        context: context,
        builder: (context) => ImageDialog(image: File(image!.path)),
      );
      if (result == true) {
        return image.path;
      } else {
        return null;
      }
    }
    return null;
  }

  static void failure(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(CustomSnackBar()
          .customSnackBar('Oops', message, ContentType.failure));
  }

  static Widget loading() {
    return Center(
        child: Lottie.asset(
      'assets/images/Doctor.json',
      width: 300,
      height: 300,
      fit: BoxFit.contain,
    ));
  }
}
