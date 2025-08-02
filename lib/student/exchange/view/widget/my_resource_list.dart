import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/exchange_dialog_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resource_dialog_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resources_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/custom_my_resource.dart';
import 'package:dentech_smile/student/exchange/view/widget/my_resource_dialog.dart';
import 'package:dentech_smile/student/exchange/view/widget/my_resource_main_dialog.dart';
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
                                      BlocProvider<ExchangeDialogCubit>(
                                        create: (context) =>
                                            ExchangeDialogCubit(
                                                item.id, item.image, false),
                                        child: const MyResourceMainDialog(),
                                      ));
                              if (result != null && result != "trans") {
                                if (!context.mounted) {
                                  return;
                                }
                                Static.failure(context, result);
                              } else if (result == "trans") {
                                if (!context.mounted) {
                                  return;
                                }
                                String? result = await showDialog(
                                    context: context,
                                    builder: (context) =>
                                        BlocProvider<MyResourceDialogCubit>(
                                          create: (context) =>
                                              MyResourceDialogCubit(),
                                          child: MyResourceDialog(
                                            id: item.id,
                                          ),
                                        ));
                                if (result != null && result == "success") {
                                  if (!context.mounted) {
                                    return;
                                  }
                                  BlocProvider.of<MyResourcesCubit>(context)
                                      .updateStatus(item);
                                } else if (result != null) {
                                  if (!context.mounted) {
                                    return;
                                  }
                                  Static.failure(context, result);
                                }
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
        } else if (state is MyResourcesLoading) {
          return Static.loading();
        } else {
          return Container();
        }
      },
    );
  }
}
