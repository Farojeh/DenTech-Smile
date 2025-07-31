import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/learning/controller/cubit/learning_cubit.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_internship.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningDetailsPage extends StatelessWidget {
  final int type ;
  final String title;
  const LearningDetailsPage({super.key, required this.title , required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LearningCubit, LearningState>(
      listener: (context, state) {
       if(state is Learningfailure){
        Static.failure(context, state.errormessage);
       }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  LearnTop(title: title),
                  const LearnInternship(),
                   LearnList(type:type ,)
                ],
              ),
            ),
          )),
    );
  }
}
