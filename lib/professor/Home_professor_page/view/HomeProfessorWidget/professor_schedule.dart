import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_schedule_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentech_smile/core/utils/style.dart';

// ignore: must_be_immutable
class ProfessorSchedule extends StatelessWidget {
  const ProfessorSchedule({super.key});

  final List<String> days = const [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ProfessorHomeCubit, ProfessorHomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            top: size.height * 0.025,
            bottom: size.height * 0.025,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Weekly schedule',
                  style: TextStyle(
                    fontFamily: Static.arialRoundedMTfont,
                    color: Colors.black,
                    fontSize: (size.width / 430) * 21,
                  ),
                ),

                // Day Selector
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.02 , left: 5),
                  height: size.height * 0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: days.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: size.width * 0.03),
                    itemBuilder: (context, index) {
                      final isSelected = context
                              .read<ProfessorHomeCubit>()
                              .daysSelectedIndex ==
                          index;

                      return GestureDetector(
                        onTap: () {
                          context
                              .read<ProfessorHomeCubit>()
                              .changeSelectedIndex(index);
                        },
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width / 430) * 100,
                          height:
                              (MediaQuery.of(context).size.height / 932) * 42,
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Styles.basicColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              days[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: (size.width / 430) * 14,
                                fontFamily: 'Afacad',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

               userInfo!.getInt(Static.userRole)!=null && userInfo!.getInt(Static.userRole)==4?Container(): ProfessorScheduleList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
