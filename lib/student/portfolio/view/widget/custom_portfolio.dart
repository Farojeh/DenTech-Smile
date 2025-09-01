import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/portfolio/controller/cubit/portfolio_cubit.dart';
import 'package:dentech_smile/student/portfolio/view/widget/case_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPortfolio extends StatelessWidget {
  const CustomPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      builder: (context, state) {
        if (state is PortfolioSuccess) {
          return Column(
            children: state.internship.isNotEmpty
                ? state.internship
                    .map((e) => Container(
                          height: 147,
                          margin: const EdgeInsets.only(bottom: 10, left: 40),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Static.getwieght(context, 17),
                                        color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${e.degree} ",
                                    style: TextStyle(
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Static.getwieght(context, 17),
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  )
                                ],
                              ),
                              CaseWidget(
                                e: e,
                              )
                            ],
                          ),
                        ))
                    .toList()
                : [
                    Container(
                      margin: EdgeInsets.only(
                          left: Static.getwieght(context, 30),
                          right: 80,
                          top: 70),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/File searching-rafiki.png",
                        height: 250,
                        width: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      "No Content yet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400,
                          fontSize: Static.getwieght(context, 18),
                          color: const Color(0xff325060)),
                    )
                  ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
