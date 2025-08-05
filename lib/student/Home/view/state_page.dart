import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/add_image_cubit.dart';
import 'package:dentech_smile/student/Home/controller/cubit/state_page_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/after_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/befor_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/description_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/info_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/top_satet.dart';
import 'package:dentech_smile/student/Home/view/widget/xray_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatePage extends StatefulWidget {
  final String id;
  final String name;
  final String start;
  final String patien;
  final String end;
  const StatePage(
      {super.key,
      required this.id,
      required this.patien,
      required this.name,
      required this.start,
      required this.end});

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  String appointmentid = "null";
  String des = "null";
  @override
  Widget build(BuildContext context) {
    return BlocListener<StatePageCubit, StatePageState>(
      listener: (context, state) {
        if (state is StatePagefailure) {
          Static.failure(context, state.errormessage);
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          showDialog(
            context: context,
            barrierDismissible: false, // يمنع إغلاقه بالضغط خارج الديالوج
            builder: (BuildContext context) {
              return const Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Center(
                  child: CircularProgressIndicator(), // شكل اللودينغ
                ),
              );
            },
          );

          String result = await BlocProvider.of<StatePageCubit>(context)
              .savedesc(appointmentid, des);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          if (result == "successs") {
            return true;
          } else if (result == "success") {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Saved successfully"),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              ),
            );
            return true;
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Save failed"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            ));
            return false;
          }
        },
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<StatePageCubit, StatePageState>(
              builder: (context, state) {
                if (state is StatePagesuccess) {
                  appointmentid = state.appointmentid;
                  des = state.previousdescription ?? " ";
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopState(
                            appointmentid: state.appointmentid,
                            des: state.previousdescription ?? " ",
                            name: widget.name,
                            start: widget.start,
                            end: widget.end),
                        const SizedBox(
                          height: 15,
                        ),
                        InfoWidget(
                          patient: widget.patien,
                          patientid: state.patientid,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        DescriptionWidget(
                          des: state.previousdescription,
                          id: state.appointmentid,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        XRayWidget(
                          image: state.xrayimage,
                        ),
                        BlocProvider<AddImageCubit>(
                          create: (context) => AddImageCubit(),
                          child: BeforWidget(
                            images: state.befor,
                            appointmentid: state.appointmentid,
                          ),
                        ),
                        BlocProvider<AddImageCubit>(
                          create: (context) => AddImageCubit(),
                          child: AfterWidget(
                            images: state.after,
                            appointmentid: state.appointmentid,
                          ),
                        )
                      ],
                    ),
                  );
                } else if (state is StatePageloading) {
                  return Static.loading();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
