import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleLoadBody extends StatelessWidget {
  const ArticleLoadBody({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);
    double vertical = Static.getheight(context, 10);

    return BlocConsumer<PageCubit, PageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //////// هون لما عم اكتب مقالة كبيرة عم يعطي غلط
        return SingleChildScrollView(
          child: Container(
            height: Static.getheight(context, 340),
            padding: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: Static.getwidth(context, 10),
                      height: Static.getheight(context, 10),
                      decoration: const BoxDecoration(
                        color: Styles.basicColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: Static.getwidth(context, 16)),
                    Text(
                      'Please enter the text of the article.',
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: Static.getwidth(context, 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Container(
                    width: Static.getwidth(context, 320),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color.fromRGBO(200, 200, 200, 1),
                        width: 1,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: TextFormField(
                        controller: context.read<PageCubit>().linkController,
                        onChanged: (value) {
                          context.read<PageCubit>().articleContent = value;
                        },
                        maxLines: 8,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(244, 244, 244, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
