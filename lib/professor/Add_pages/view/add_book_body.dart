import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Book/add_book_button.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Book/app_bar_title_book.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Book/book_container.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Book/book_load_body.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Book/book_rating_body.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Book/book_stage.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBookBody extends StatelessWidget {
  const AddBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 34);

    return BlocProvider(
      create: (context) => PageCubit(),
      child: BlocConsumer<PageCubit, PageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PageLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return  Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            shadowColor: Colors.white.withOpacity(0),
            leading: const AppBarBackArrow(),
            title: const AppBarTitleBook()),
        body: SingleChildScrollView(
          child: Column(
            children: [
             const BookContainer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontal),
                child:const Divider(color: Color.fromRGBO(133, 177, 188, 1)),
              ),
             const BookRatingBody(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontal),
                child:const Divider(color: Color.fromRGBO(133, 177, 188, 1)),
              ),
             const BookStage(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontal),
                child: Divider(color: Color.fromRGBO(133, 177, 188, 1)),
              ),
              BookLoadBody(),
              AddBookButton(oldContext: context),
            ],
          ),
        ),
      );
          }
        },
      ),
    );
  }
}
