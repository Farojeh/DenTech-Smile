import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/patient/Available_doctor_page/model/argument_model.dart';
import 'package:dentech_smile/patient/Home_page/model/request_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class PatientDoctorBlock extends StatelessWidget {
  final RequestStatusModel student;
  final int index;
  const PatientDoctorBlock({
    super.key,
    required this.student,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top :8.0, bottom: 11 ,left: 20,right: 20),
      child: Container(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height / 932) * 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(100, 217, 217, 217),
        ),
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.appointmentsDoctor,
              extra: AppointmentArgs(student: student, index: index),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/female-doctor.png',
                    width: Static.getwieght(context, 100),
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      student.students![index].name!,
                      style:const TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      student.students![index].year!,
                      style:const TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: student.students![index].avgEvaluation!.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 212, 175, 55),
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
