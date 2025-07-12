import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDayWidget extends StatelessWidget {
  const SelectDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Static.getwieght(context, 25),
          top: Static.gethieght(context, 22),
          bottom: Static.gethieght(context, 1)),
      height: Static.gethieght(context, 45),
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          if (state is HomeInitial) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                      onTap: () => cubit.selectday(index),
                      child: Container(
                        height: Static.gethieght(context, 45),
                        width: Static.getwieght(context, 100),
                        margin: EdgeInsets.only(
                            right: Static.getwieght(context, 13)),
                        decoration: BoxDecoration(
                            color: state.select == index
                                ? const Color(0xff328F96)
                                : const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          cubit.days[index].name,
                          style: TextStyle(
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              fontSize: Static.getwieght(context, 15),
                              color: state.select == index
                                  ? Colors.white
                                  : Static.lightcolor2),
                        ),
                      ),
                    ));
          } else {
            return const Text("somthing wrong");
          }
        },
      ),
    );
  }
}
