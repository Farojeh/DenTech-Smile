import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientAppBarShowMenu extends StatelessWidget {
  const PatientAppBarShowMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      offset: const Offset(50, 50),
      icon: Image.asset('assets/images/drawer.png', width: 40, height: 40),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: () {
            GoRouter.of(context).push(AppRouter.profile);
          },
          child: const Text(
            'الملف الشخصي',
            style: TextStyle(fontFamily: 'Afacad', fontWeight: FontWeight.w500),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          onTap: () {
            GoRouter.of(context).push(AppRouter.aboutApp);
          },
          child: Text(
            'حول التطبيق',
            style: TextStyle(fontFamily: 'Afacad', fontWeight: FontWeight.w500),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 3,
          child: Text(
            'تسجيل الخروج',
            style: TextStyle(fontFamily: 'Afacad', fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
