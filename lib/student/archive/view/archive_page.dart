import 'package:dentech_smile/student/archive/controller/cubit/archive_cubit.dart';
import 'package:dentech_smile/student/archive/view/widget/archive_internship.dart';
import 'package:dentech_smile/student/archive/view/widget/archive_list.dart';
import 'package:dentech_smile/student/archive/view/widget/archive_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArchiveCubit>(
      create: (context) => ArchiveCubit(),
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 10,
              ),
              const ArchiveTop(),
              const ArchiveInternship(),
              const ArchiveList()
            ],
          ),
        ),
      )),
    );
  }
}
