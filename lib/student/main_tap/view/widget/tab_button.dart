import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isSelected;
  const TabButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 18,
            height: 18,
            color: isSelected ? Static.basiccolor : Static.lightcolor2,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Static.basiccolor : Static.lightcolor2,
              fontFamily: Static.afacadfont,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
