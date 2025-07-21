import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Notifications_page/model/NotificationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<NotificationModel> notifications = [
      NotificationModel(
        details: 'تم تأكيد موعدك مع الدكتور أحمد يوم الأحد الساعة 10 صباحاً.',
        title: 'تأكيد موعد',
        time: 'منذ ساعتين',
      ),
      NotificationModel(
        details: 'تم إلغاء الموعد مع الدكتور هيثم بسبب ظرف طارئ.',
        title: 'إلغاء موعد',
        time: 'اليوم - 9:30 صباحاً',
      ),
      NotificationModel(
        details: 'تذكير: لديك موعد مع الدكتورة لمى غداً الساعة 1 ظهراً.',
        title: 'تذكير بالموعد',
        time: 'منذ 10 دقائق',
      ),
    ];

    return Directionality(
      textDirection: context.watch<ThemeCubit>().isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Styles.basicColor,
        body: Stack(
          children: [
            Container(color: Styles.basicColor),
            Positioned.fill(
              child: Image.asset(
                'assets/images/background2.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenHeight * 0.085,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/Logo.png',
                  height: screenHeight * 0.075,
                  width: screenWidth * 0.47,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.043,
              right: screenWidth * 0.037,
              child: GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Container(
                  width: screenWidth * 0.093,
                  height: screenWidth * 0.093,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 0.47),
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.093 / 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/VectorWhite.png',
                    width: screenWidth * 0.056,
                    height: screenWidth * 0.056,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.215,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.018,
                    vertical: screenHeight * 0.017,
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.034),
                    itemBuilder: (context, index) {
                      return notificationList(
                        notifications[index],
                        screenWidth,
                        screenHeight,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: screenHeight * 0.007),
                    itemCount: notifications.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationList(
    NotificationModel notificationModel,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(243, 243, 243, 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: const AssetImage('assets/images/notifi.png'),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationModel.title,
                    style: TextStyle(
                      fontFamily: 'afacad',
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    notificationModel.details,
                    style: TextStyle(
                      fontFamily: 'afacad',
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    notificationModel.time,
                    style: TextStyle(
                      fontFamily: 'afacad',
                      fontSize: screenWidth * 0.028,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
