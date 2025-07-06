import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final Widget child;
  final double? redtl;
  final double? redtr;
  final double? redbl;
  final double? redbr;
  final double? paddingwidth;
  final Color? side;
  final int? elevation ;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.color,
    required this.height,
    required this.width,
    required this.child,
    this.paddingwidth,
    this.onPressed,
    this.redtl,
    this.redtr,
    this.redbl,
    this.redbr,
    this.side, this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingwidth ?? 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: side != null
                  ? BorderSide(width: 1.2, color: side!)
                  : BorderSide.none,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(redtl ?? 0),
                topRight: Radius.circular(redtr ?? 0),
                bottomLeft: Radius.circular(redbl ?? 0), // ← هنا كان فيه تكرار خطأ أصلحناه
                bottomRight: Radius.circular(redbr ?? 0),
              ),
            ),
          ),
          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
          backgroundColor: MaterialStatePropertyAll(
            side == null ? color : Color.fromARGB(255, 255, 255, 255),
          ),
          elevation:elevation==null?null :const MaterialStatePropertyAll(6),
          surfaceTintColor: MaterialStatePropertyAll(Colors.transparent), // هذا التعديل المهم هنا
        ),
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
