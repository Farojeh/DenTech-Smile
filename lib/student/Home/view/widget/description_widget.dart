import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/description_cubit.dart';
import 'package:dentech_smile/student/Home/controller/cubit/state_page_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:dentech_smile/student/Home/view/widget/description_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionWidget extends StatelessWidget {
  final String? des;
  final String id;
  const DescriptionWidget({super.key, this.des, required this.id});

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
          onTapfun: () async {
            String? result = await showDialog(
                context: context,
                builder: (context) => BlocProvider<DescriptionCubit>(
                      create: (context) => DescriptionCubit(des ?? ""),
                      child: DescriotionDialog(
                        init: des ?? "",
                        appointmentid: id,
                      ),
                    ));
            if (result != null) {
              if (!context.mounted) return;
              BlocProvider.of<StatePageCubit>(context).setdes(result);
            }
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
            des ?? "no description yet!",
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
