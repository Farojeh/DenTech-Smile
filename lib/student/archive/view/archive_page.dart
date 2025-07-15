import 'package:dentech_smile/student/archive/view/widget/archive_internship.dart';
import 'package:dentech_smile/student/archive/view/widget/archive_list.dart';
import 'package:dentech_smile/student/archive/view/widget/archive_top.dart';
import 'package:flutter/material.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10, left: 20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ArchiveTop(), ArchiveInternship(), ArchiveList()],
        ),
      ),
    ));
  }
}
