import 'package:flutter/material.dart';

class ProfessorAppBarShowMenu extends StatelessWidget {
  const ProfessorAppBarShowMenu({super.key});

  @override
  Widget build(BuildContext context) { 
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      offset: const Offset(50, 50),
      icon: Image.asset('assets/images/drawer.png', width: (MediaQuery.of(context).size.width / 430) * 40, height: (MediaQuery.of(context).size.height / 932) * 40,),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: () {},
          child: Text(
            'Student marks',
            style: TextStyle(fontFamily: 'Afacad', fontWeight: FontWeight.w500),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 2,
          child: Text(
            'Log out',
            style: TextStyle(fontFamily: 'Afacad', fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
