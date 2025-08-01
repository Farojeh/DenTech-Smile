import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExchangeTop extends StatelessWidget {
  const ExchangeTop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            InkWell(
              overlayColor:
                  MaterialStatePropertyAll(Colors.white.withOpacity(0)),
              onTap: () => GoRouter.of(context).pop(),
              child: Container(
                height: Static.gethieght(context, 44),
                width: Static.gethieght(context, 44),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white.withOpacity(0.51), width: 0.5),
                    color: const Color(0xffBEBEBE).withOpacity(0.24)),
                padding: const EdgeInsets.all(10.5),
                child: Image.asset("assets/images/arrow_back_white.png"),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              " Resource exchange ",
              style: TextStyle(
                  fontFamily: Static.arialRoundedMTfont,
                  color: Colors.white,
                  fontSize: Static.getwieght(context, 24)),
            ),
            const Spacer(),
            PopupMenuButton<int>(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: const Color.fromARGB(255, 220, 220, 220),
                offset: const Offset(50, 35),
                icon: Image.asset(
                  "assets/images/right 1.png",
                  height: Static.gethieght(context, 30),
                  width: Static.gethieght(context, 30),
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        height: Static.gethieght(context, 40),
                        value: 1,
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.myresourcespage);
                        },
                        child: Text(
                          "My resources",
                          style: TextStyle(
                              color: Static.lightcolor,
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        height: Static.gethieght(context, 40),
                        value: 1,
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.myexchange);
                        },
                        child: Text(
                          "Exchanges",
                          style: TextStyle(
                              color: Static.lightcolor,
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ),
                    ]),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
