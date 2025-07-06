import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Static{
  static String abhayaLibrefont = "AbhayaLibre";
  static String afacadfont = "Afacad";
  static String arialRoundedMTfont = "ArialRoundedMT";
  static Color basiccolor = Color(0xff006A71);
  static Color lightcolor = Color(0xff353535);
  static String ipconfig = "192.168.37.207";
  static String userName = "userName";
  static String userNumber = "userNumber";
  static String userPassword = "userPassword";
  static String userRole = "userRole";//2 for patient , 1 for student , 4 for doctor
  static String token = "Token";


static void home(BuildContext context){
  if(userInfo!.getInt(userRole)==1){
   GoRouter.of(context).pushReplacement(AppRouter.studenthome);
  }else if(userInfo!.getInt(userRole)==2){
    GoRouter.of(context).pushReplacement(AppRouter.datapatient);
  }else{
     GoRouter.of(context).pushReplacement(AppRouter.professor);
  }
}

}