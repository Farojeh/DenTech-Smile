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
    return BlocProvider<PortfolioCubit>(
      create: (context) => PortfolioCubit(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 20,
            ),
            const TopPortfolio(),
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
      )),
    );
  }
}
