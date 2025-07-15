import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/Home/view/home_page.dart';
import 'package:dentech_smile/student/archive/view/archive_page.dart';
import 'package:dentech_smile/student/portfolio/portfolio_page.dart';
import 'package:dentech_smile/student/profile/profile_page.dart';
import 'package:dentech_smile/student/qr_code/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'tab_cubit_state.dart';

class TabCubitCubit extends Cubit<TabCubitState> {
  TabCubitCubit() : super(const TabCubitState(selectedIndex: 2, selectedPage: HomePage()));

  void changeTab(int index) {
    Widget newPage;
    switch (index) {
      case 0:
        newPage = const QrCodePage();
        break;
      case 1:
        newPage = const PortfolioPage();
        break;
      case 2:
        newPage = const HomePage();
        break;
      case 3:
        newPage = const ArchivePage();
        break;
      case 4:
        newPage = const ProfilePage();
        break;
      default:
        newPage = const HomePage();
    }
    emit(TabCubitState
    (selectedIndex: index, selectedPage: newPage));
  }

}
