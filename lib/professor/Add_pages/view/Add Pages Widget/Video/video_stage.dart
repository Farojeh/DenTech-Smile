import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:dentech_smile/professor/Add_pages/model/stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoStage extends StatefulWidget {
  //final void Function(int id) onSelect;
  const VideoStage({super.key});

  @override
  State<VideoStage> createState() => _VideoStageState();
}

class _VideoStageState extends State<VideoStage> {
  List<StageModel> stage = [
    StageModel(id: 1, name: 'Orthodontic'),
    StageModel(id: 3, name: 'Oral Medicine'),
    StageModel(id: 4, name: 'Gum Disease'),
    StageModel(id: 6, name: 'Treatment'),
    StageModel(id: 7, name: 'Dental Treatments'),
    StageModel(id: 8, name: 'Oral Surgery'),
    StageModel(id: 2, name: 'Pediatic Dentistry'),
    StageModel(id: 5, name: 'Fixed and Removable Dentures'),
  ];

  int? selectedId;

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);

    return Container(
      // height: Static.getheight(context, 220),
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                'Choose the Internship you want',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: Static.getheight(context, 220),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 12,
              childAspectRatio: 3.5,
              children: stage.map<Widget>((StageModel item) {
                final isSelected = selectedId == item.id;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedId = item.id;
                    });
                    context.read<PageCubit>().articleStageId = selectedId!;
                  },
                  child: Row(
                    children: [
                      Container(
                        width: Static.getwidth(context, 15),
                        height: Static.getheight(context, 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: isSelected
                                ? const Color.fromRGBO(0, 106, 113, 1)
                                : Colors.grey,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: Static.getwidth(context, 7),
                                  height: Static.getheight(context, 7),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(0, 106, 113, 1),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      SizedBox(width: Static.getwidth(context, 7)),
                      Flexible(
                        child: Text(
                          item.name!,
                          style: TextStyle(
                            fontFamily: Static.afacadfont,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: Static.getwidth(context, 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
