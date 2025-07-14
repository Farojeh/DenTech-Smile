import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/description_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:dentech_smile/student/Home/view/widget/description_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitle(
          image: "assets/images/info_des.png",
          title: "Case description",
          more: "Add more",
          ismore: true,
          onTapfun: () {
            showDialog(
                context: context,
                builder: (context) => BlocProvider<DescriptionCubit>(
                      create: (context) => DescriptionCubit(),
                      child: const DescriotionDialog(init: "Patient with tooth decay",),
                    ));
          },
        ),
        Container(
          margin: EdgeInsets.only(top: Static.gethieght(context, 20)),
          height: Static.gethieght(context, 140),
          width: Static.getwieght(context, 351),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.5, color: Colors.black)),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(
              horizontal: Static.getwieght(context, 17),
              vertical: Static.getwieght(context, 7)),
          child: Text(
            "Patient with tooth decay",
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w400,
                fontSize: Static.getwieght(context, 15),
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}
