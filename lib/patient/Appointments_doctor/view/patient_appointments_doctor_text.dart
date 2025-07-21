import 'package:dentech_smile/patient/Home_page/model/request_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PatientAppointmentsDoctorText extends StatelessWidget {
  final RequestStatusModel student;
  final int index;

  const PatientAppointmentsDoctorText(
      {super.key, required this.student, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight * 0.215,
      right: screenWidth * 0.18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                student.students![index].name!,
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                student.students![index].year!,
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              RatingBarIndicator(
                rating: student.students![index].avgEvaluation!.toDouble(),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 212, 175, 55),
                ),
                itemCount: 5,
                itemSize: screenWidth * 0.04,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
