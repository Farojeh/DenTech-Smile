import 'package:dentech_smile/student/exchange/view/widget/exhanges_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';

class MyExchangesPage extends StatelessWidget {
  const MyExchangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(children: [
                  LearnTop(title: "My Exchanges"),
                  SizedBox(
                    height: 30,
                  ),
                  ExchangesList()
                ]))));
  }
}
