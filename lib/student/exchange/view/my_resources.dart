import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resources_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/my_resource_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyResourcesPage extends StatelessWidget {
  const MyResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyResourcesCubit, MyResourcesState>(
      listener: (context, state) {
        if(state is MyResourcesfailure){
          Static.failure(context, state.errormessage);
        }
      },
      child: const Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(children: [
                    LearnTop(title: "My Resources"),
                    SizedBox(
                      height: 30,
                    ),
                    MyReourceList()
                  ])))),
    );
  }
}
