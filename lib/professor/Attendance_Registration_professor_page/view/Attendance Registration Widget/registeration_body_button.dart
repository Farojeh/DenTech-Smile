import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:dentech_smile/professor/Home_professor_page/model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterationBodyButton extends StatelessWidget {
  Schedules? schedules;

  RegisterationBodyButton({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(22),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Styles.basicColor,
          ),
          onPressed: () {
            context.read<ProfessorHomeCubit>().postRecordAbsences(
                  schedules!.practical_id!,
                );
            Static.showCustomSnackbar(
              context,
              context.read<ProfessorHomeCubit>().messaage,
            );
            Navigator.of(context).pop();
          },
          child: Text(
            'Save Registration',
            style: TextStyle(
              fontFamily: 'ArialRounded',
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: Static.getwidth(context, 20),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
