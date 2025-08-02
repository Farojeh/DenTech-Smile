import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_exchanges_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/exhanges_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyExchangesPage extends StatelessWidget {
  const MyExchangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyExchangesCubit, MyExchangesState>(
      listener: (context, state) {
        if(state is MyExchangesfailure){
          Static.failure(context, state.errormessage);
        }
      },
      child: const Scaffold(
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
                  ])))),
    );
  }
}
