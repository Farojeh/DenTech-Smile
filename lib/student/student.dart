import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          print(userInfo!.getString(Static.userName));
          print(userInfo!.getString(Static.userNumber));
        },
        child: Text("Student Page"),
      )),
    );
  }
}
