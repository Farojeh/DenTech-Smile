import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Video/add_video_button.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Video/app_bar_title_video.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Video/video_container.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Video/video_link_body.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Video/video_rating_body.dart';
import 'package:dentech_smile/professor/Add_pages/view/Add%20Pages%20Widget/Video/video_stage.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddVideoBody extends StatelessWidget {
  const AddVideoBody({super.key});

  @override
  Widget build(BuildContext context) {
    //  final formKey = GlobalKey<FormState>();
    
    //double rating = 0;
    //int? stageId;

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
                title: const AppBarTitleVideo(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    VideoContainer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontal),
                      child: const Divider(
                        color: Color.fromRGBO(133, 177, 188, 1),
                      ),
                    ),
                    const VideoRatingBody(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontal),
                      child: const Divider(
                        color: Color.fromRGBO(133, 177, 188, 1),
                      ),
                    ),
                    const VideoStage(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontal),
                      child: const Divider(
                        color: Color.fromRGBO(133, 177, 188, 1),
                      ),
                    ),
                    VideoLinkBody(),
                    AddVideoButton(
                      oldContext: context,
                     
                    ),
                  ],
                ),
              ),
              // bottomNavigationBar:
            );
          }
        },
      ),
    );
  }
}
