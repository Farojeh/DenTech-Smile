import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArticleRatingBody extends StatelessWidget {
  const ArticleRatingBody({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);

    return Container(
      height: Static.getheight(context, 100),
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: Static.getwidth(context, 10),
                height: Static.getheight(context, 10),
                decoration: const BoxDecoration(
                  color: Styles.basicColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: Static.getwidth(context, 16)),
              Text(
                'Choose the appropriate rating',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
            ],
          ),
          RatingBar.builder(
            initialRating: 0.0,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: Static.getwidth(context, 35),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Color.fromARGB(255, 212, 175, 55),
            ),
            onRatingUpdate: (value) {
              context.read<PageCubit>().articleRate = value.toInt();
            },
          ),
        ],
      ),
    );
  }
}
