import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Archive_professor_page/model/doctor_archive_model.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ProfessorArchiveBlock extends StatelessWidget {
  DoctorArchiveModel? doctorArchiveModel;
  ProfessorArchiveBlock({super.key, required this.doctorArchiveModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        width: double.infinity,
        height: Static.getheight(context, 115),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.015),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: doctorArchiveModel!.studentImage==null? Image.asset(
                      "assets/images/female-doctor.png",
                      width: Static.getwidth(context, 115),
                      height: Static.getheight(context, 90),
                      fit: BoxFit.cover,
                    ):Image.network("${Static.urlimagewithoutstorage}${doctorArchiveModel!.studentImage}",
                     width: Static.getwidth(context, 115),
                      height: Static.getheight(context, 90),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: Static.getwidth(context, 15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctorArchiveModel!.studentName!,
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwidth(context, 18),
                      ),
                    ),
                    SizedBox(height: Static.getheight(context, 4)),
                    RatingBarIndicator(
                      rating: doctorArchiveModel!.evaluationScore!,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 212, 175, 55),
                      ),
                      itemCount: 5,
                      itemSize: Static.getwidth(context, 17),
                      direction: Axis.horizontal,
                    ),
                    SizedBox(height: Static.getheight(context, 4)),
                    Text(
                      doctorArchiveModel!.patientName!,
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwidth(context, 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Map<String, String> map = {
                  "score": doctorArchiveModel!.evaluationScore.toString(),
                  "sessionId": doctorArchiveModel!.sessionId.toString()
                };
                GoRouter.of(context).push(AppRouter.caseDoctor, extra: map);
                context.read<CaseCubit>().getDoctorCase(
                      doctorArchiveModel!.sessionId!,
                    );
              },
              child: Container(
                width: Static.getwidth(context, 36),
                height: Static.getheight(context, 36),
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
                  'assets/images/arrow_patient.png',
                  color: Static.basiccolor,
                  width: Static.getwidth(context, 11),
                  height: Static.getheight(context, 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
