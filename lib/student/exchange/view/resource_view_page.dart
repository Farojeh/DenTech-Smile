import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/resource_view_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/resource_view_list.dart';
import 'package:dentech_smile/student/learning/views/widget/learn_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceViewPage extends StatelessWidget {
  final String type;
  const ResourceViewPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResourceViewCubit, ResourceViewState>(
      listener: (context, state) {
       if(state is ResourceViewfailure){
        return Static.failure(context, state.errormessage);
       }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(children: [
                    LearnTop(title: type),
                    const SizedBox(
                      height: 30,
                    ),
                    const ResourceViewList()
                  ])))),
    );
  }
}
