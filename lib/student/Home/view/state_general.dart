import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/state_general_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/befor_general.dart';
import 'package:dentech_smile/student/Home/view/widget/des_general.dart';
import 'package:dentech_smile/student/Home/view/widget/info_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/top_state_general.dart';
import 'package:dentech_smile/student/Home/view/widget/xray_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateGeneral extends StatelessWidget {
  final String name;
  final String patien;
  final double rate;
  const StateGeneral(
      {super.key,
      required this.name,
      required this.patien,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StateGeneralCubit, StateGeneralState>(
      listener: (context, state) {
        if (state is StateGeneralfailure) {
          Static.failure(context, state.errormessage);
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<StateGeneralCubit, StateGeneralState>(
            builder: (context, state) {
              if (state is StateGeneralsuccess) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopStateGeneral(name: name, rate: rate),
                      const SizedBox(
                        height: 15,
                      ),
                      InfoWidget(
                        patient: patien,
                        patientid: state.patientid,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DesGeneral(
                          des: state.previousdescription ??
                              "no descresption yet!"),
                      const SizedBox(
                        height: 25,
                      ),
                      XRayWidget(
                        image: state.xrayimage,
                      ),
                      BeforGeneral(
                          images: state.befor,
                          image: "assets/images/befor.png",
                          title: "Before treatment"),
                      BeforGeneral(
                          images: state.after,
                          image: "assets/images/befor.png",
                          title: "Before treatment"),
                    ],
                  ),
                );
              } else if (state is StateGeneralloading) {
                return Static.loading();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
