import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/student/learning/controller/cubit/artical_cubit.dart';
import 'package:dentech_smile/student/learning/model/artical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticalDialog extends StatelessWidget {
  final String auther;
  final int id;
  const ArticalDialog({super.key, required this.id, required this.auther});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticalCubit>(
      create: (context) => ArticalCubit(id, auther),
      child: BlocListener<ArticalCubit, ArticalState>(
        listener: (context, state) async {
          if (state is ArticalSuccess) {
            Artical artical = Artical(
                image: state.image,
                title: state.title,
                author: state.author,
                time: state.time,
                isimage: state.isimage,
                artical: state.artical);
            Navigator.of(context).pop();
            GoRouter.of(context).push(AppRouter.artical, extra: artical);
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
                child: BlocBuilder<ArticalCubit, ArticalState>(
                  builder: (context, state) {
                    if (state is ArticalLoading) {
                      return const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is ArticalFailure) {
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
