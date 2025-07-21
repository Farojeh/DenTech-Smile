import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/patient/Archive_page/model/ArchiveModel.dart';
import 'package:dentech_smile/patient/Case_page/controller/patient_case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class PatientArchiveBlock extends StatelessWidget {
  final StudentsArchive patientCase;
  const PatientArchiveBlock({super.key, required this.patientCase});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.13,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.015),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/doctor_male.png",
                      width: screenWidth * 0.2,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      patientCase.name!,
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.004),
                    Text(
                      patientCase.year!,
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: patientCase.averageEvaluation!.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 212, 175, 55),
                      ),
                      itemCount: 5,
                      itemSize: screenWidth * 0.035,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(height: screenHeight * 0.004),
                    Text(
                      patientCase.stageName!,
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            BlocConsumer<PatientCaseCubit, PatientCaseState>(
              listener: (context, state) {},
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.status,
                      extra: patientCase,
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 133, 177, 188),
                        width: 0.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Vector2.png',
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
