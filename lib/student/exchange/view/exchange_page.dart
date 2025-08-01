import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/view/widget/exchange_top.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _animateFromCenterTo(double finalX, double finalY, double width,
      double height, Size screenSize) {
    final centerX = (screenSize.width - width) / 2;
    final centerY = (screenSize.height - height) / 2;
    return Offset(
      centerX + (finalX - centerX) * _animation.value,
      centerY + (finalY - centerY) * _animation.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // الأبعاد النهائية للعناصر
    final referencesW = Static.getwieght(context, 257);
    final referencesH = Static.gethieght(context, 75);
    final paperW = Static.getwieght(context, 268);
    final paperH = Static.gethieght(context, 75);
    final generalW = Static.getwieght(context, 191);
    final generalH = Static.gethieght(context, 139);
    final medicalW = Static.getwieght(context, 195);
    final medicalH = Static.gethieght(context, 142);

    // إحداثياتها النهائية
    final referencesFinal = Offset(
      Static.getwieght(context, 80),
      Static.gethieght(context, 190),
    );
    final paperFinal = Offset(
      Static.getwieght(context, 30),
      Static.gethieght(context, 361),
    );
    final generalFinal = Offset(
      size.width - Static.getwieght(context, 31) - generalW,
      Static.gethieght(context, 510),
    );
    final medicalFinal = Offset(
      Static.getwieght(context, 38),
      Static.gethieght(context, 616),
    );

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/learn_backgroundcopy.jpg",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          const ExchangeTop(),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final referencesPos = _animateFromCenterTo(referencesFinal.dx,
                  referencesFinal.dy, referencesW, referencesH, size);
              final paperPos = _animateFromCenterTo(
                  paperFinal.dx, paperFinal.dy, paperW, paperH, size);
              final generalPos = _animateFromCenterTo(
                  generalFinal.dx, generalFinal.dy, generalW, generalH, size);
              final medicalPos = _animateFromCenterTo(
                  medicalFinal.dx, medicalFinal.dy, medicalW, medicalH, size);

              return Stack(
                children: [
                  Positioned(
                    top: referencesPos.dy,
                    left: referencesPos.dx,
                    child: SizedBox(
                      height: referencesH,
                      width: referencesW,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.white.withOpacity(0)),
                        onTap: () => GoRouter.of(context).push(
                            AppRouter.resourcepage,
                            extra: "Books and References"),
                        child: Image.asset("assets/images/references.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                    top: paperPos.dy,
                    left: paperPos.dx,
                    child: SizedBox(
                      height: paperH,
                      width: paperW,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.white.withOpacity(0)),
                        onTap: () => GoRouter.of(context).push(
                            AppRouter.resourcepage,
                            extra: "Paper Lectures"),
                        child: Image.asset("assets/images/paper.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                    top: generalPos.dy,
                    left: generalPos.dx,
                    child: SizedBox(
                      height: generalH,
                      width: generalW,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.white.withOpacity(0)),
                        onTap: () => GoRouter.of(context)
                            .push(AppRouter.resourcepage, extra: "General"),
                        child: Image.asset("assets/images/general.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                    top: medicalPos.dy,
                    left: medicalPos.dx,
                    child: SizedBox(
                      height: medicalH,
                      width: medicalW,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.white.withOpacity(0)),
                        onTap: () => GoRouter.of(context).push(
                            AppRouter.resourcepage,
                            extra: "Medical Instruments"),
                        child: Image.asset("assets/images/medical.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: Static.gethieght(context, 45),
                      right: Static.getwieght(context, 23),
                      child: CustomButton(
                          onPressed: () =>
                              GoRouter.of(context).push(AppRouter.addresource),
                          color: const Color(0xff0F6C73),
                          elevation: 5,
                          redbl: 15,
                          redbr: 15,
                          redtl: 15,
                          redtr: 15,
                          height: Static.gethieght(context, 52),
                          width: Static.getwieght(context, 140),
                          child: Text(
                            "Add Resources",
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontWeight: FontWeight.w400,
                                fontSize: Static.getwieght(context, 19),
                                color: Colors.white),
                          )))
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
