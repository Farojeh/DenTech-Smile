import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddResourceBack extends StatelessWidget {
  final Widget screen;
  const AddResourceBack({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                  opacity: 0.19,
                  child: Image.asset(
                    "assets/images/background.png",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).padding.top + 7,
                  left: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      overlayColor: MaterialStatePropertyAll(
                          Colors.white.withOpacity(0)),
                      onTap: () => GoRouter.of(context).pop(),
                      child: Container(
                        height: Static.gethieght(context, 44),
                        width: Static.gethieght(context, 44),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.51),
                                width: 0.5),
                            color:
                                const Color(0xffBEBEBE).withOpacity(0.24)),
                        padding: const EdgeInsets.all(10.5),
                        child: Image.asset(
                            "assets/images/arrow_back_white.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      " Add Resources ",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          color: Colors.white,
                          fontSize: Static.getwieght(context, 24)),
                    ),
                  ])),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.88,
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
