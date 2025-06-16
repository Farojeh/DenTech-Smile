import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackgroundLogin extends StatelessWidget {
  final bool goback ;
  final Widget screen;
  const BackgroundLogin({super.key, required this.screen, required this.goback});

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
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width,
                color: Static.basiccolor,
              ),),
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
                    ),),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.asset(
                      "assets/images/login_image.png",
                      fit: BoxFit.contain,
                    ),
                  )),
             goback? Positioned(
                  top:35,
                  left: 15,
                  child: InkWell(
                    overlayColor:
                        MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                    onTap: () => GoRouter.of(context).pop(),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                        )
                      ],
                    ),
                  )):Container(),
              Positioned(
                top: MediaQuery.of(context).size.height*0.45,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration:const  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: screen,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
