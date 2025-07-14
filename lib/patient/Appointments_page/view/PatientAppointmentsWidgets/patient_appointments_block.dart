import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:flutter/material.dart';

class PatientAppointmentsBlock extends StatelessWidget {
  const PatientAppointmentsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
    padding: EdgeInsets.only(right: screenWidth * 0.02),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Styles.basicColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                Text(
                  'الأحد',
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ],
            ),
            Text(
              '(3/5/2025)',
              style: TextStyle(
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.035,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: InkWell(
            onTap: () {
              Static.showMyDialog(
                context,            
       'هل تريد تأكيد الموعد يوم الاحد\n الساعة 11 Am \n',
);
            },
            child: Container(
              width: screenWidth * 0.18,
              height: screenHeight * 0.045,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.55)),
              ),
              child: Center(
                child: Text(
                  '3:10 Am',
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
  }
}