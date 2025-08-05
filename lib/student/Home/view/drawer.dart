import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/animated_drawer.dart';
import 'package:dentech_smile/student/Home/view/widget/pdf_portfolio_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StaticDrawer {
  static OverlayEntry? _overlayEntry;

  static void close(BuildContext context) {
    if (_overlayEntry == null) {
      return;
    }
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      return;
    }
  }

  static void toggleDrawer(BuildContext context, double left, double top) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
          left: left,
          top: top,
          child: AnimatedDrawer(
            left: left,
            top: top,
            onClose: () {
              _overlayEntry?.remove();
              _overlayEntry = null;
            },
          )),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static Widget title(BuildContext context, String image, String text , int id ) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
      onTap: () {
        if (id==1) {
          close(context);
          GoRouter.of(context).push(AppRouter.learning);
        } else if(id == 2) {
          close(context);
          GoRouter.of(context).push(AppRouter.exchangepage);
        }else{
           close(context);
           showDialog(
        context: context,
        builder: (context) => const PdfPortfolioDialog(),
      );
        }
      },
      child: Row(
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xff464646)),
          )
        ],
      ),
    );
  }
}
