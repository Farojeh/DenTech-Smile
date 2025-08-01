import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resource_dialog_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resources_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/custom_my_resource.dart';
import 'package:dentech_smile/student/exchange/view/widget/my_resource_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyReourceList extends StatelessWidget {
  const MyReourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyResourcesCubit, MyResourcesState>(
      builder: (context, state) {
        if (state is MyResourcesSuccess) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state.resources.isNotEmpty
                  ? state.resources
                      .map((item) => CustomMyResource(
                          item: item,
                          onTap: () async {
                            if (item.status) {
                              String? result = await showDialog(
                                  context: context,
                                  builder: (context) =>
                                      BlocProvider<MyResourceDialogCubit>(
                                        create: (context) =>
                                            MyResourceDialogCubit(),
                                        child: const MyResourceDialog(),
                                      ));
                              if (result != null && result == "success") {
                                // ignore: use_build_context_synchronously
                                BlocProvider.of<MyResourcesCubit>(context)
                                    .updateStatus(item);
                              } else if (result != null) {
                                // ignore: use_build_context_synchronously
                                Static.failure(context, result);
                              }
                            }
                          }))
                      .toList()
                  : [
                      Container(
                        margin: const EdgeInsets.only(right: 50, top: 70),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/File searching-rafiki.png",
                          height: 250,
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        "No Content In This Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: Static.afacadfont,
                            fontWeight: FontWeight.w400,
                            fontSize: Static.getwieght(context, 18),
                            color: const Color(0xff325060)),
                      )
                    ]);
        } else {
          return Container();
        }
      },
    );
  }
}
