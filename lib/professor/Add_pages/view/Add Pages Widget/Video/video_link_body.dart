import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoLinkBody extends StatelessWidget {
  const VideoLinkBody({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);

    return Container(
      height: Static.getheight(context, 120),
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: Static.getwidth(context, 10),
                height: Static.getheight(context, 10),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 106, 113, 1),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: Static.getwidth(context, 16)),
              Text(
                'Please enter the YouTube video link.',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: context.read<PageCubit>().linkController,
            onChanged: (value) {
              context.read<PageCubit>().videoPath = value;
            },
            // validator: (value) {
            //   if (value == null || value.trim().isEmpty) {
            //     return "Link is required";
            //   }
            //   return null;
            // },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.28),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.28),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(244, 244, 244, 1),
            ),
          ),
        ],
      ),
    );
  }
}
