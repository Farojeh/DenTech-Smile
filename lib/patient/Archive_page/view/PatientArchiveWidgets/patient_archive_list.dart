import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Archive_page/view/PatientArchiveWidgets/patient_archive_block.dart';
import 'package:dentech_smile/patient/Case_page/controller/patient_case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientArchiveList extends StatelessWidget {
  const PatientArchiveList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<PatientCaseCubit, PatientCaseState>(
      listener: (context, state) {
        if (state is PatientCaseFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is PatientCaseLoading) {
          return SizedBox(
            height: screenHeight,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is PatientArchiveSuccess) {
          final archiveModel = state.archiveModel;
          return archiveModel.students!.isNotEmpty
              ? Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: archiveModel.students!.length,
                      separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.01,
                        ),
                        child: Container(
                          width: screenWidth * 0.85,
                          height: 0.5,
                          color: const Color.fromARGB(255, 34, 158, 189),
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return PatientArchiveBlock(
                          patientCase: archiveModel.students![index],
                        );
                      },
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: Image.asset(
                      "assets/images/File searching-rafiki.png",
                      height: 250,
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_doctor.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    context.watch<ThemeCubit>().isArabic
                        ? Lang.arabLang["message5"]!
                        : Lang.enLang["message5"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Styles.basicColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    context.watch<ThemeCubit>().isArabic
                        ? Lang.arabLang["message2"]!
                        : Lang.enLang["message2"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
