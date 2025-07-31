import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/learning/controller/cubit/youtubecontent_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeDialod extends StatelessWidget {
  final int id;
  const YoutubeDialod({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<YoutubecontentCubit>(
      create: (context) => YoutubecontentCubit(id),
      child: BlocListener<YoutubecontentCubit, YoutubecontentState>(
        listener: (context, state) async {
          if (state is YoutubecontentSuccess) {
            String youtubeUrl = state.path;
            final Uri url = Uri.parse(youtubeUrl);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              // ignore: use_build_context_synchronously
              Static.failure(context, 'Could not launch youtubeUrl');
            }
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          }
        },
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: BlocBuilder<YoutubecontentCubit, YoutubecontentState>(
                  builder: (context, state) {
                    if (state is YoutubecontentLoading) {
                      return const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is Youtubecontentfailure) {
                      return Center(
                        child: Text(state.errormessage),
                      );
                    } else {
                      return Container();
                    }
                  },
                ))),
      ),
    );
  }
}
