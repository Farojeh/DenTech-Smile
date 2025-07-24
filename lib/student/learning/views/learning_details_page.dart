import 'package:dentech_smile/student/learning/views/widget/learn_internship.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';

class LearningDetailsPage extends StatelessWidget {
  final String title ;
  const LearningDetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
           padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
            LearnTop(title: title),
           const LearnInternship(),
           const LearnList()
            ],
          ),
        ),
      )
    );
  }
}