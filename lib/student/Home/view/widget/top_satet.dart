import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/state_page_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/waveclipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopState extends StatelessWidget {
  final String appointmentid;
  final String des;
  final String name;
  final String start;
  final String end;
  const TopState(
      {super.key,
      required this.name,
      required this.start,
      required this.end,
      required this.appointmentid,
      required this.des});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Static.gethieght(context, 250),
          width: MediaQuery.of(context).size.width,
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: Static.gethieght(context, 245),
            width: MediaQuery.of(context).size.width,
            color: Colors.black87,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/images/state.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            left: Static.getwieght(context, 15),
            top: MediaQuery.of(context).padding.top + 10,
            child: InkWell(
              onTap: () async {
                bool res = await back(context, appointmentid, des);
                if (res) {
                  if (!context.mounted) return;
                  GoRouter.of(context).pop();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffBEBEBE).withOpacity(0.24),
                    border: Border.all(
                        width: 0.5, color: Colors.white.withOpacity(0.51))),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )),
        Positioned(
            left: Static.getwieght(context, 70),
            top: MediaQuery.of(context).padding.top + 13,
            child: Text(
              "$name Internship",
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w500,
                  fontSize: Static.getwieght(context, 25),
                  color: Colors.white),
            )),
        Positioned(
            right: Static.getwieght(context, 68),
            bottom: Static.getwieght(context, 30),
            child: Text(
              "[ $start ] [ $end ]",
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w400,
                  fontSize: Static.getwieght(context, 16),
                  color: Colors.black),
            )),
      ],
    );
  }

  Future<bool> back(
      BuildContext context, String appointmentid, String des) async {
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
  }
}
