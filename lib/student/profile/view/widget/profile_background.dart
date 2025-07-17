import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/view/widget/top_profile.dart';
import 'package:flutter/material.dart';
class Profilebackground extends StatelessWidget {
  final Widget screen;
  const Profilebackground({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 60,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Static.basiccolor,
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Static.basiccolor,
                ),
              ),
              Positioned(
                top: 0,
                child: Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    "assets/images/background.png",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.08,
                  child:const TopProfile()),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.445,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: screen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
