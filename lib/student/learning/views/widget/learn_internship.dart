import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/learning/controller/cubit/learning_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnInternship extends StatelessWidget {
  const LearnInternship({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 5),
      height: Static.gethieght(context, 45),
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<LearningCubit, LearningState>(
        builder: (context, state) {
          final cubit = context.read<LearningCubit>();
          if (state is LearningSuccess) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.allinternships.length,
                itemBuilder: (context, index) => InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                      onTap: () => cubit.changeselect(index),
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 2),
                        height: Static.gethieght(context, 45),
                        width: Static.getwieght(context, 137),
                        margin: EdgeInsets.only(
                            right: Static.getwieght(context, 13)),
                        decoration: BoxDecoration(
                            color:state.select==index
                                ? const Color(0xff325060)
                                : const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          state.allinternships[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              fontSize: Static.getwieght(context, 16),
                              color: state.select==index
                                  ? Colors.white
                                  : Static.lightcolor2),
                        ),
                      ),
                    ));
          }else if(state is LearningLoading){
            return Container();
          } else {
            return const Text("Somthing error");
          }
        },
      ),
    );
  }
}
