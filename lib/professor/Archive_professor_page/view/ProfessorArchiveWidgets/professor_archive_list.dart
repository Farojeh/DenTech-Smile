import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Archive_professor_page/model/doctor_archive_model.dart';
import 'package:dentech_smile/professor/Archive_professor_page/view/ProfessorArchiveWidgets/professor_archive_block.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfessorArchiveList extends StatelessWidget {
  List<DoctorArchiveModel>? doctorArchiveModelList;
  ProfessorArchiveList({super.key, required this.doctorArchiveModelList});

  @override
  Widget build(BuildContext context) {
    final horizontal = Static.getwidth(context, 33);
    final vertical = Static.getheight(context, 10);
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: doctorArchiveModelList!.length,
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertical,
            ),
            child: Container(
              height: 1,
              color: const Color.fromRGBO(133, 177, 188, 1),
            ),
          ),
          itemBuilder: (context, index) {
            return ProfessorArchiveBlock(
              doctorArchiveModel: doctorArchiveModelList![index],
            );
          },
        ),
      ],
    );
  }
}
