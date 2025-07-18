import 'package:dentech_smile/student/Home/view/drawer.dart';
import 'package:dentech_smile/student/main_tap/controller/cubit/tab_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubitCubit, TabCubitState>(
      builder: (context, state) {
        var cubit = context.read<TabCubitCubit>();
        return SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {
              StaticDrawer.close(context);
              cubit.changeTab(2);
            },
            shape: const CircleBorder(),
            child: Container(
               width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: state.selectedIndex == 2
                  ? const LinearGradient(
                      colors: [
                        Color(0xFF004F54), // Start color
                        Color(0xFF328F96), // End color
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              color: state.selectedIndex == 2 ? null : Color.fromARGB(255, 0, 53, 57),
              shape:BoxShape.circle,
          ),
             padding:const EdgeInsets.all(14),
              child: Image.asset(
                "assets/images/home_icon.png",
                height: 30,
                width: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
