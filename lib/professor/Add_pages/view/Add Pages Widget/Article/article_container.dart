import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleContainer extends StatelessWidget {
  final TextEditingController controller;
  const ArticleContainer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);
    double horizontal2 = Static.getwidth(context, 12);
    double vertical = Static.getheight(context, 10);

    return Container(
      height: Static.getheight(context, 170),
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              context.read<PageCubit>().postImage();
            },
            child: SizedBox(
              height: Static.getheight(context, 120),
              width: Static.getwidth(context, 120),
              child: Image.asset(
                'assets/images/Component 3.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: Static.getwidth(context, 22)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please enter the name and \nimage of the required content',
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: Static.getwidth(context, 16),
                  ),
                ),
                SizedBox(height: Static.getheight(context, 16)),
                TextFormField(
                  controller: controller,
                  onChanged: (value) {
                    context.read<PageCubit>().articleName = value;
                  },
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return "Name is required";
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontal2,
                      vertical: vertical,
                    ),
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
          ),
        ],
      ),
    );
  }
}
