import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/exchange_dialog_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_exchanges_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/custom_resource.dart';
import 'package:dentech_smile/student/exchange/view/widget/exchange_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangesList extends StatelessWidget {
  const ExchangesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyExchangesCubit, MyExchangesState>(
      builder: (context, state) {
        if (state is MyExchangesSuccess) {
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
                                  builder: (context) =>
                                      BlocProvider<ExchangeDialogCubit>(
                                        create: (context) =>
                                            ExchangeDialogCubit(item.id , item.image , true),
                                        child: const ExchangeDilaog(),
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
        }else if(state is MyExchangesLoading){
          return Static.loading();
        }
         else {
          return Container();
        }
      },
    );
  }
}
