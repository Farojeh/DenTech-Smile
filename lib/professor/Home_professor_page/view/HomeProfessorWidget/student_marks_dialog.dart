import 'package:dentech_smile/professor/Home_professor_page/controller/cubit/student_marks_cubit.dart';
import 'package:dentech_smile/student/Home/controller/cubit/portfolio_pdf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentMarkDialod extends StatelessWidget {
  const StudentMarkDialod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentMarksCubit>(
      create: (context) => StudentMarksCubit(),
      child: BlocListener<StudentMarksCubit, StudentMarksState>(
        listener: (context, state) async {
          if (state is PortfolioPdfSuccess) {
            // Navigator.of(context).pop();
          }
        },
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: BlocBuilder<StudentMarksCubit, StudentMarksState>(
                  builder: (context, state) {
                    if (state is StudentMarksLoading) {
                      return const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is StudentMarksFailure) {
                      return Center(
                        child: Text(state.errormessage),
                      );
                    } else if (state is StudentMarksSuccess) {
                      return Center(
                        child: Text(state.path),
                      );
                    } else {
                      return Container();
                    }
                  },
                ))),
      ),
    );
  }
}
