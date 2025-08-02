import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/exchange_dialog_cubit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MyResourceMainDialog extends StatelessWidget {
  const MyResourceMainDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExchangeDialogCubit, ExchangeDialogState>(
      listener: (context, state) {
        if (state is ExchangeDialogfailure) {
          Navigator.of(context).pop(state.errormessage);
        }
      },
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: BlocBuilder<ExchangeDialogCubit, ExchangeDialogState>(
                builder: (context, state) {
                  if (state is ExchangeDialogSuccess) {
                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: Image.network(
                                  "${Static.urlimage}${state.resource.image}",
                                  height: state.resource.image.length > 23
                                      ? Static.gethieght(context, 100)
                                      : Static.gethieght(context, 80),
                                  width: Static.getwieght(context, 90),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      state.resource.name,
                                      style: TextStyle(
                                          fontFamily: Static.arialRoundedMTfont,
                                          fontSize:
                                              Static.getwieght(context, 19),
                                          color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    state.resource.type,
                                    style: TextStyle(
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w400,
                                        fontSize: Static.getwieght(context, 16),
                                        color: Static.lightcolor2),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${state.resource.startdate} to ${state.resource.enddate}",
                                    style: TextStyle(
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w400,
                                        fontSize: Static.getwieght(context, 16),
                                        color: Static.lightcolor2),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Booked by",
                                style: TextStyle(
                                    fontFamily: Static.arialRoundedMTfont,
                                    color: Colors.black,
                                    fontSize: 19),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                "[ 0${state.number} ]",
                                style: TextStyle(
                                    fontFamily: Static.afacadfont,
                                    fontWeight: FontWeight.w400,
                                    color: Static.lightcolor2,
                                    fontSize: 11),
                              ),
                              
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15 , left: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.name,
                                  style: TextStyle(
                                      fontFamily: Static.afacadfont,
                                      fontWeight: FontWeight.w400,
                                      color: Static.lightcolor2,
                                      fontSize: 15),
                                ),
                                InkWell(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.white.withOpacity(0)),
                                  onTap: () async {
                                    final Uri whatsappUrl = Uri.parse(
                                        "https://wa.me/963${state.number}");
                                    if (await canLaunchUrl(whatsappUrl)) {
                                      await launchUrl(whatsappUrl,
                                          mode: LaunchMode.externalApplication);
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pop();
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pop(
                                          "0${state.number} dosn't have whatsapp");
                                    }
                                  },
                                  child: Text(
                                    "go to whatsapp",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Static.basiccolor,
                                        fontSize: 15,
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                redbl: 10,
                                redbr: 10,
                                redtl: 10,
                                redtr: 10,
                                  onPressed: () async {
                                    Navigator.of(context).pop("trans");
                                  },
                                  color: Static.basiccolor,
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text("Change Status" , style: TextStyle(
                                    fontFamily: Static.afacadfont,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white
                                  ),)),
                              const SizedBox(
                                width: 15,
                              )
                            ],
                          )
                        ]);
                  } else if (state is ExchangeDialogLoading) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Static.basiccolor,
                            )),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ))),
    );
  }
}
