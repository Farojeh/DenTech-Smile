import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  List<Map<String, String>> profile = [
    {
      "id": "1",
      "image": "assets/images/edit 1.png",
      "title": "Edit Email",
      "padding": "7.5"
    },
    {
      "id": "2",
      "image": "assets/images/password 1.png",
      "title": "Edit Password",
      "padding": "5"
    },
    {
      "id": "3",
      "image": "assets/images/notification 1.png",
      "title": "Notification",
      "padding": "8"
    },
    {
      "id": "4",
      "image": "assets/images/logout 1.png",
      "title": "Log out ",
      "padding": "8"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 22, left: 43, right: 43),
      child: Column(
        children: profile
            .map((item) => Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(double.parse(item["padding"]!)),
                          margin: const EdgeInsets.only(
                              bottom: 10, top: 10, left: 10, right: 10),
                          height: Static.gethieght(context, 40),
                          width: Static.gethieght(context, 40),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Static.basiccolor),
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          item["title"]!,
                          style: TextStyle(
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: Static.getwieght(context, 23)),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/images/right-arrow 1.png",
                          height: Static.gethieght(context, 20),
                          width: Static.gethieght(context, 20),
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 0.3,
                      color: Color(0xff626262),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
