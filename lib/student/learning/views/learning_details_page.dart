import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/learning/controller/cubit/learning_cubit.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_internship.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LearningDetailsPage extends StatelessWidget {
  final int type;
  final String title;
  final bool add;
  const LearningDetailsPage(
      {super.key, required this.title, required this.type, this.add = false});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LearningCubit, LearningState>(
      listener: (context, state) {
        if (state is Learningfailure) {
          Static.failure(context, state.errormessage);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: add
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 5),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      if (type == 1) {
                        GoRouter.of(context).pushReplacement(AppRouter.addBook);
                      } else if (type == 2) {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.addVideo);
                      } else {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.addArticle);
                      }
                    },
                    label: Text(
                      type == 1
                          ? "Add Books"
                          : type == 2
                              ? "Add Videos"
                              : "Add Articles",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400),
                    ),
                    icon: const Icon(Icons.add),
                    backgroundColor: Static.basiccolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  LearnTop(title: title),
                  const LearnInternship(),
                  LearnList(
                    type: type,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
