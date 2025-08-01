import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/reservation_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/resource_view_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/custom_resource.dart';
import 'package:dentech_smile/student/exchange/view/widget/reservation_Dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceViewList extends StatelessWidget {
  const ResourceViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResourceViewCubit, ResourceViewState>(
      builder: (context, state) {
        if (state is ResourceViewSuccess) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state.resources.isNotEmpty
                  ? state.resources
                      .map((item) => CustomResource(
                            item: item,
                            onTap: () async {
                              String? result = await showDialog(
                                  context: context,
                                  builder: (context) => BlocProvider<ReservationCubit>(
                                        create: (context) => ReservationCubit(),
                                        child: const ReservationDialog(),
                                      ));
                              if (result != null) {
                                // ignore: use_build_context_synchronously
                                Static.failure(context, result);
                              }
                            },
                          ))
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
