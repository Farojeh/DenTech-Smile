import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/patient/Profile_page/model/profile_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileModel> fields = [
    ProfileModel(
      id: 1,
      text: 'تعديل الاسم ',
      icon: 'assets/images/id-card 1.png',
    ),
    ProfileModel(
      id: 2,
      text: 'تعديل الايميل ',
      icon: 'assets/images/email (2) 1.png',
    ),
    ProfileModel(
      id: 3,
      text: 'الادوية التي تتناولها ',
      icon: 'assets/images/drugs 1.png',
    ),
    ProfileModel(
      id: 4,
      text: ' الامراض التي تعاني منها ',
      icon: 'assets/images/diagnosis 1.png',
    ),
    ProfileModel(id: 5, text: 'تعديل العمر ', icon: 'assets/images/age 1.png'),
    ProfileModel(
      id: 6,
      text: 'تعديل الوزن ',
      icon: 'assets/images/scales 1.png',
    ),
    ProfileModel(
      id: 7,
      text: 'تعديل الطول ',
      icon: 'assets/images/height (1) 1.png',
    ),
    ProfileModel(
      id: 8,
      text: 'تغيير كلمة السر',
      icon: 'assets/images/padlock 1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
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
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.004,
                  bottom: screenHeight * 0.004,
                  right: screenWidth * 0.02,
                ),
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
            ),
            Positioned.fill(
              top: screenHeight * 0.215,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.07),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return fieldsList(
                        fields[index],
                        screenWidth,
                        screenHeight,
                        context,
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.017,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 0.5,
                        color: const Color.fromRGBO(105, 105, 105, 1),
                      ),
                    ),
                    itemCount: fields.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fieldsList(
    ProfileModel profileModel,
    double screenWidth,
    double screenHeight,
    BuildContext context,
  ) =>
      Row(
        children: [
          Image.asset(
            profileModel.icon!,
            height: screenHeight * 0.037,
            width: screenWidth * 0.08,
            fit: BoxFit.contain,
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Text(
              profileModel.text!,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.038,
                color: const Color.fromRGBO(105, 105, 105, 1),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showWeightDialog(
                context,
                profileModel.icon!,
                profileModel.text!,
                screenWidth,
                screenHeight,
              );
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: screenHeight * 0.037,
              width: screenWidth * 0.08,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromRGBO(0, 128, 128, 1),
                  width: 1.5,
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/left_vector.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      );
}

void showWeightDialog(
  BuildContext context,
  String icon,
  String text,
  double screenWidth,
  double screenHeight,
) {
  final TextEditingController weightController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.all(screenWidth * 0.037),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
                    height: screenHeight * 0.037,
                    width: screenWidth * 0.08,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.038,
                        color: const Color.fromRGBO(105, 105, 105, 1),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.017,
                  bottom: screenHeight * 0.017,
                  right: screenWidth * 0.02,
                  left: screenWidth * 0.055,
                ),
                child: Container(
                  width: double.infinity,
                  height: 0.5,
                  color: const Color.fromRGBO(105, 105, 105, 1),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'التعديل: ',
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.038,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.28,
                      height: screenHeight * 0.1,
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFBDBDBD),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFBDBDBD),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.31,
                  height: screenHeight * 0.042,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.basicColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'تعديل',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
