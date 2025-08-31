import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/student_marks_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfessorAppBarShowMenu extends StatelessWidget {
  const ProfessorAppBarShowMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      offset: const Offset(50, 50),
      icon: Image.asset(
        'assets/images/drawer.png',
        width: (MediaQuery.of(context).size.width / 430) * 40,
        height: (MediaQuery.of(context).size.height / 932) * 40,
      ),
      itemBuilder: userInfo!.getInt(Static.userRole) == 3
          ? (context) => [
                PopupMenuItem(
                  value: 1,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const StudentMarkDialod(),
                    );
                  },
                  child: const Text(
                    'Student marks',
                    style: TextStyle(
                        fontFamily: 'Afacad', fontWeight: FontWeight.w500),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  onTap: () {
                    String fcmtoken = userInfo!.getString('fcm_token')!;
                    userInfo!.clear();
                    userInfo!.setString('fcm_token', fcmtoken);
                    GoRouter.of(context).pushReplacement('/');
                  },
                  value: 2,
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                        fontFamily: 'Afacad', fontWeight: FontWeight.w500),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  onTap: () {
                    String fcmtoken = userInfo!.getString('fcm_token')!;
                    userInfo!.clear();
                    userInfo!.setString('fcm_token', fcmtoken);
                    GoRouter.of(context).pushReplacement('/');
                  },
                  value: 2,
                  child:const Text(
                    'Log out',
                    style: TextStyle(
                        fontFamily: 'Afacad', fontWeight: FontWeight.w500),
                  ),
                ),
              ],
    );
  }
}
