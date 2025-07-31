import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Learnpage extends StatefulWidget {
  const Learnpage({super.key});

  @override
  State<Learnpage> createState() => _LearnpageState();
}

class _LearnpageState extends State<Learnpage>
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

    final youtubeW = Static.getwieght(context, 191);
    final youtubeH = Static.gethieght(context, 142);

    final referencesW = Static.getwieght(context, 257);
    final referencesH = Static.gethieght(context, 75);

    final scientificW = Static.getwieght(context, 191);
    final scientificH = Static.gethieght(context, 144);

    final youtubeFinal = Offset(
      Static.getwieght(context, 32),
      size.height - Static.gethieght(context, 180) - youtubeH,
    );
    final referencesFinal = Offset(
      Static.getwieght(context, 48),
      Static.gethieght(context, 200),
    );
    final scientificFinal = Offset(
      size.width - Static.getwieght(context, 15) - scientificW,
      size.height - Static.gethieght(context, 365) - scientificH,
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
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 15,
            child: Row(
              children: [
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
                  " Learning community ",
                  style: TextStyle(
                      fontFamily: Static.arialRoundedMTfont,
                      color: Colors.white,
                      fontSize: Static.getwieght(context, 24)),
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final youtubePos = _animateFromCenterTo(
                  youtubeFinal.dx, youtubeFinal.dy, youtubeW, youtubeH, size);
              final referencesPos = _animateFromCenterTo(referencesFinal.dx,
                  referencesFinal.dy, referencesW, referencesH, size);
              final scientificPos = _animateFromCenterTo(scientificFinal.dx,
                  scientificFinal.dy, scientificW, scientificH, size);

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
                            AppRouter.learningdetails,
                            extra:{"title": "Books and references", "type": 1}),
                        child: Image.asset("assets/images/references.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                    top: youtubePos.dy,
                    left: youtubePos.dx,
                    child: SizedBox(
                      height: youtubeH,
                      width: youtubeW,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.white.withOpacity(0)),
                        onTap: () => GoRouter.of(context).push(
                            AppRouter.learningdetails,
                            extra: {"title": "YouTube videos", "type": 2}),
                        child: Image.asset("assets/images/youtube.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                    top: scientificPos.dy,
                    left: scientificPos.dx,
                    child: SizedBox(
                      height: scientificH,
                      width: scientificW,
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(
                            Colors.white.withOpacity(0)),
                        onTap: () => GoRouter.of(context).push(
                            AppRouter.learningdetails,
                            extra: {"title": "Scientific articles", "type": 3} ),
                        child: Image.asset("assets/images/scientific.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
