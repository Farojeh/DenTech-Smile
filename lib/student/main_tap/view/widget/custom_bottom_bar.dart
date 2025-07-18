import 'package:dentech_smile/student/Home/view/drawer.dart';
import 'package:dentech_smile/student/main_tap/controller/cubit/tab_cubit_cubit.dart';
import 'package:dentech_smile/student/main_tap/view/widget/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubitCubit, TabCubitState>(
      builder: (context, state) {
        var cubit = context.read<TabCubitCubit>();
        return Container(
          color: Colors.white.withOpacity(0),
          child: BottomAppBar(
            color: const Color.fromARGB(255, 225, 225, 225),
            surfaceTintColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 1,
            notchMargin: 12,
            height: 61,
            shape: const CircularNotchedRectangle(),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabButton(
                      title: "Qr Code",
                      icon: "assets/images/qr-code.png",
                      onTap: () {
                        StaticDrawer.close(context);
                        cubit.changeTab(0);
                      },
                      isSelected: state.selectedIndex == 0),
                  TabButton(
                      title: "Portfolio",
                      icon: "assets/images/documents.png",
                      onTap: () {
                        StaticDrawer.close(context);
                        cubit.changeTab(1);
                      },
                      isSelected: state.selectedIndex == 1),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                  TabButton(
                      title: "Archive",
                      icon: "assets/images/inbox.png",
                      onTap: () {
                        StaticDrawer.close(context);
                        cubit.changeTab(3);
                      },
                      isSelected: state.selectedIndex == 3),
                  TabButton(
                      title: "Profile",
                      icon: "assets/images/profile.png",
                      onTap: () {
                        StaticDrawer.close(context);
                        cubit.changeTab(4);
                      },
                      isSelected: state.selectedIndex == 4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
