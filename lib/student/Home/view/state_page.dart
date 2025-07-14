import 'package:dentech_smile/student/Home/view/widget/add_appointment_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/after_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/befor_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/description_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/info_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/top_satet.dart';
import 'package:dentech_smile/student/Home/view/widget/xray_widget.dart';
import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  final String name;
  final String start;
  final String end;
  const StatePage(
      {super.key, required this.name, required this.start, required this.end});

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopState(name: widget.name, start: widget.start, end: widget.end),
              const SizedBox(
                height: 15,
              ),
              const InfoWidget(),
              const SizedBox(
                height: 25,
              ),
              const DescriptionWidget(),
              const SizedBox(
                height: 25,
              ),
              const AddAppointmentWidget(),
              const XRayWidget(),
              const BeforWidget(),
              const AfterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
