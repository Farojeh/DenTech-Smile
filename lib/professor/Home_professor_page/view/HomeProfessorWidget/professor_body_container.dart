import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfessorBodyContainer extends StatelessWidget {
  const ProfessorBodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: (MediaQuery.of(context).size.width / 430) * 374,
        height: (MediaQuery.of(context).size.height / 932) * 222,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Mask group.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Positioned(
                top: size.height * 0.04 > 30 ? 30 : size.height * 0.04,
                left: 25,
                child: Text(
                  'Scan Qr Code',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 21,
                    fontFamily: Static.arialRoundedMTfont,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.08 > 65 ? 65 : size.height * 0.08,
                left: size.width * 0.012 > 5 ? 5 : size.width * 0.012,
                right: size.width * 0.46 > 155 ? 155 : size.width * 0.46,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Scan the code on the student\'s mobile phone and evaluate it',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 15,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height / 932) * (65 + 80),
                left: (MediaQuery.of(context).size.width / 430) * (20 + 23),
                width: (MediaQuery.of(context).size.width / 430) * 103,
                height: (MediaQuery.of(context).size.height / 932) * 38,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.white.withOpacity(0)
                  ),
                  onPressed: () async {
                    GoRouter.of(context).push(AppRouter.scanQrCode);
                  },

                  child: Text(
                    'Scan',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
