import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:flutter/material.dart';

class DialogFinalEvaluate extends StatelessWidget {
  const DialogFinalEvaluate({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    double horizontal = Static.getwidth(context, 40);
    double vertical = Static.getheight(context, 25);
    double horizontal2 = Static.getwidth(context, 24.0);
    double vertical2 = Static.getheight(context, 16.0);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: Static.getwidth(context, 350),
        height: Static.getheight(context, 400),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Evaluate The State',
                style: TextStyle(
                  fontFamily: 'ArialRounded',
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: Static.getwidth(context, 20),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Static.getheight(context, 10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/star.png',
                    height: Static.getheight(context, 25),
                    width: Static.getwidth(context, 25),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: Static.getwidth(context, 10)),
                  Text(
                    'Enter Degree',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                      fontSize: Static.getwidth(context, 20),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Static.getheight(context, 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Static.getwidth(context, 110),
                    height: Static.getheight(context, 35),
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.28),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.28),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(244, 244, 244, 1),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Static.getheight(context, 14)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/chat.png',
                    height: Static.getheight(context, 25),
                    width: Static.getwidth(context, 25),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: Static.getwidth(context, 10)),
                  Text(
                    'Enter a comment on the status',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                      fontSize: Static.getwidth(context, 20),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: vertical2,
                  horizontal: horizontal2,
                ),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontal,
                      vertical: vertical,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.28),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.28),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(244, 244, 244, 1),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(140, 45),
                  backgroundColor: Styles.basicColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.black, width: 0.5),
                  ),
                ),
                child: Text(
                  'Evaluate',
                  style: TextStyle(
                    fontFamily: 'ArialRounded',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: Static.getwidth(context, 18),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
