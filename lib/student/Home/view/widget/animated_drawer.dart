import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/drawer.dart';
import 'package:flutter/material.dart';

class AnimatedDrawer extends StatefulWidget {
  final double left;
  final double top;
  final VoidCallback onClose;

  const AnimatedDrawer({super.key, 
    required this.left,
    required this.top,
    required this.onClose,
  });

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: Static.getwieght(context, 250),
          height: Static.gethieght(context, 120),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(
              width: 0.5,
              color: Colors.black.withOpacity(0.63),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
          child: Column(
            children: [
              StaticDrawer.title(context,"assets/images/study.png", "Learning Community"),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              StaticDrawer.title(context,"assets/images/men-exchanging-symbol.png", "Resources Exchanges"),
            ],
          ),
        ),
      ),
    );
  }
}
