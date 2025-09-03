import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/patient/Notifications_page/cubit/notification_cubit.dart';
import 'package:dentech_smile/patient/Notifications_page/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  final bool isar;
  const NotificationPage({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: isar ? TextDirection.rtl : TextDirection.ltr,
      child: BlocListener<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is Notificationfailure) {
            Static.failure(context, state.errormessage);
          }
        },
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
                    'assets/images/logo.png',
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.47,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.043,
                right: screenWidth * 0.05,
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
                    padding: const EdgeInsets.only(left: 2),
                    child: Image.asset(
                      'assets/images/VectorWhite.png',
                      width: screenWidth * 0.045,
                      height: screenWidth * 0.045,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.2,
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
                  child: BlocBuilder<NotificationCubit, NotificationState>(
                    builder: (context, state) {
                      if (state is NotificationLoading) {
                        return Static.loading();
                      } else if (state is NotificationSuccess) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.018,
                            vertical: screenHeight * 0.017,
                          ),
                          child: state.notifications.isNotEmpty
                              ? ListView.separated(
                                  padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.034),
                                  itemBuilder: (context, index) {
                                    return notificationList(
                                      state.notifications[index],
                                      screenWidth,
                                      screenHeight,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                          height:
                                              Static.gethieght(context, 20)),
                                  itemCount: state.notifications.length,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 200),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/Messages-rafiki.png",
                                        height: 250,
                                        width: 250,
                                        fit: BoxFit.contain,
                                      ),
                                      Text("No Notifications yet " , style: TextStyle(
                                        color: Static.lightcolor2,
                                        fontSize: 18,
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w300
                                      ),)
                                    ],
                                  ),
                                ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
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
        margin: const EdgeInsets.symmetric(horizontal: 7),
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(243, 243, 243, 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Image.asset('assets/images/notifi.png'),
            ),
            const SizedBox(width: 10),
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
