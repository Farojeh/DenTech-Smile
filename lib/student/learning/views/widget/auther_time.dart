import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class AutherTime extends StatelessWidget {
  final String auther;
  final String time;
  const AutherTime({super.key, required this.auther, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    auther,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: const Color.fromARGB(255, 9, 133, 139),
                      fontWeight: FontWeight.w400,
                      fontFamily: Static.afacadfont,
                    ),
                  ),
                ],
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    size: 25,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: const Color.fromARGB(255, 9, 133, 139),
                      fontWeight: FontWeight.w400,
                      fontFamily: Static.afacadfont,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
