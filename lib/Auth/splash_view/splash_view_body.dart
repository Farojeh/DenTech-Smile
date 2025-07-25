import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToWelcomView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.height,
      width: media.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/background.png",
            height: media.height,
            width: media.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/sp_v_logo.png",
                height: media.height * 0.25,
                width: media.width * 0.5,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DenTech Smile",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: Static.abhayaLibrefont,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/tooth.png",
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "make healthy teeth and beautiful smile with us",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff615F5F)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void navigateToWelcomView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // GoRouter.of(context).pushReplacement(AppRouter.learning);
        //  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        // userInfo!.clear();
        if(userInfo!.getString(Static.token)==null ){
          GoRouter.of(context).pushReplacement(AppRouter.welcomView);
        }else{
          Static.home(context);
        }

        // GoRouter.of(context).pushReplacement(AppRouter.mainTabView);
        // GoRouter.of(context).pushReplacement(AppRouter.datapatient);
        // if (userInfo!.getBool("user") == null ||
        //     userInfo!.getBool("user") == false) {
        //   GoRouter.of(context).pushReplacement(AppRouter.welcomView);
        // } else {
        //   mainuser = UserModel(
        //       email: userInfo!.getString("email")!,
        //       password: userInfo!.getString("password")!);
        //   GoRouter.of(context).pushReplacement(AppRouter.onboarding);
        // }
      },
    );
  }
}
