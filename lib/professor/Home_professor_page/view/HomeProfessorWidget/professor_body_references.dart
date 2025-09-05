import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfessorBodyReferences extends StatelessWidget {
  const ProfessorBodyReferences({super.key});

  @override
  Widget build(BuildContext context) {
    final margin = 33.0;

    final boxWidth = (MediaQuery.of(context).size.width / 430) * 80;
    final boxHeight = (MediaQuery.of(context).size.height / 932) * 70;
    final textHeight = (MediaQuery.of(context).size.height / 932) * 50;
    final spacing = (MediaQuery.of(context).size.width / 430) * 48;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: margin, top: 20, left: margin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBox(
              context,
              () {
                GoRouter.of(context).push(AppRouter.learningdetails,
                    extra: {"title": "YouTube videos", "type": 2, "add": isSupervisor()});
              },
              boxWidth,
              boxHeight,
              textHeight,
              'assets/images/social.png',
              'Youtube \nVideos',
            ),
            SizedBox(width: spacing),
            _buildBox(
              context,
              () {
                GoRouter.of(context).push(AppRouter.learningdetails, extra: {
                  "title": "Scientific articles",
                  "type": 3,
                  "add": isSupervisor()
                });
              },
              boxWidth,
              boxHeight,
              textHeight,
              'assets/images/content-writing.png',
              'Scientific \narticles',
            ),
            SizedBox(width: spacing),
            _buildBox(
              context,
              () {
                GoRouter.of(context).push(AppRouter.learningdetails, extra: {
                  "title": "Books and references",
                  "type": 1,
                  "add": isSupervisor()
                });
              },
              boxWidth,
              boxHeight,
              textHeight,
              'assets/images/book (2).png',
              'Books and \nreferences',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(
    BuildContext context,
    void Function()? onTap,
    double width,
    double height,
    double textHeight,
    String imagePath,
    String label,
  ) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Styles.basicColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                height: (MediaQuery.of(context).size.height / 932) * 50,
                width: (MediaQuery.of(context).size.width / 430) * 50,
              ),
            ),
          ),
          SizedBox(
            height: textHeight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ArialRounded',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: (MediaQuery.of(context).size.width / 430) * 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isSupervisor() {
    if (userInfo!.getInt(Static.userRole) == 4) {
      return false;
    } else {
      return true;
    }
  }
}
