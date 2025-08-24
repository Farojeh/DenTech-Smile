import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Article/add_article_button.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Article/app_bar_title_article.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Article/article_container.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Article/article_load_body.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Article/article_rating_body.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Article/article_stage.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddArticleBody extends StatelessWidget {
  const AddArticleBody({super.key});

  @override
  Widget build(BuildContext context) {
    //  final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController articleController = TextEditingController();

    // double rating = 0;
    // int? stageId;

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
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(0),
                shadowColor: Colors.white.withOpacity(0),
                leading: const AppBarBackArrow(),
                title: const AppBarTitleArticle(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ArticleContainer(controller: nameController),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontal),
                      child: const Divider(
                        color: Color.fromRGBO(133, 177, 188, 1),
                      ),
                    ),
                   const ArticleRatingBody(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontal),
                      child: const Divider(
                        color: Color.fromRGBO(133, 177, 188, 1),
                      ),
                    ),
                   const ArticleStage(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontal),
                      child: const Divider(
                        color: Color.fromRGBO(133, 177, 188, 1),
                      ),
                    ),
                    ArticleLoadBody(controller: articleController),
                    AddArticleButton(
                oldContext: context,
                // formKey: formKey,
                nameController: nameController,
                //stageIdGetter: () => stageId,
                //ratingGetter: () => rating,
              ),
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
