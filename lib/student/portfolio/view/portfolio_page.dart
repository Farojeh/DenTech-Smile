import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/portfolio/controller/cubit/portfolio_cubit.dart';
import 'package:dentech_smile/student/portfolio/view/widget/custom_portfolio.dart';
import 'package:dentech_smile/student/portfolio/view/widget/top_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PortfolioCubit, PortfolioState>(
      listener: (context, state) {
        if (state is Portfoliofailure) {
          Static.failure(context, state.errormessage);
        }
      },
      child: Scaffold(body: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          if (state is PortfolioSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 20,
                  ),
                   TopPortfolio(degree: state.totaldegree,),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 25),
                    child: Text(
                      "My works during my study years",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          fontSize: Static.getwieght(context, 18),
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomPortfolio(),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            );
          } else if (state is PortfolioLoading) {
            return Static.loading();
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
