import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:dentech_smile/restart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientAppBarShowMenu extends StatelessWidget {
  const PatientAppBarShowMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<ThemeCubit>().isArabic;
    final profileText =
        isArabic ? Lang.arabLang["Profile"]! : Lang.enLang["Profile"]!;
    final aboutText =
        isArabic ? Lang.arabLang["About_app"]! : Lang.enLang["About_app"]!;
    final changeLangText =
        isArabic ? Lang.arabLang["change_lang"]! : Lang.enLang["change_lang"]!;
    final logoutText =
        isArabic ? Lang.arabLang["Log_out"]! : Lang.enLang["Log_out"]!;

    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      offset: const Offset(50, 50),
      icon: Image.asset(
        'assets/images/drawer.png',
        width: Static.gethieght(context, 40),
        height: Static.gethieght(context, 40),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: () {
            Future.delayed(Duration.zero, () {
              GoRouter.of(context).push(AppRouter.profile);
            });
          },
          child: Text(
            profileText,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          onTap: () {
            Future.delayed(Duration.zero, () {
              GoRouter.of(context).push(AppRouter.aboutApp);
            });
          },
          child: Text(
            aboutText,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 3,
          onTap: () {
            Future.delayed(Duration.zero, () {
              context.read<ThemeCubit>().changeLang();
            });
            context.read<PatientCubit>().newEmit();
          },
          child: Text(
            changeLangText,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          onTap: () async {
            String? fcmtoken = userInfo!.getString(Static.fcmToken);
            await userInfo!.remove(Static.token);
            await userInfo!.remove(Static.userRole);

            if (fcmtoken != null) {
              await userInfo!
                  .setString(Static.fcmToken, fcmtoken); // 👈 نفس المفتاح
            }

            print("*********************************");
            print(userInfo!
                .getString(Static.fcmToken)); // 👈 لازم يطبع نفس القيمة
            first = true;
            GoRouter.of(context).pushReplacement('/');
            RestartWidget.restartApp(context);
          },
          value: 4,
          child: Text(
            logoutText,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
