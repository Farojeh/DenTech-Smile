import 'package:dentech_smile/Auth/on_boarding/view/widget/button_part.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/top_role_page.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Toprolepage(),
           Text("Join with us As",
           style: TextStyle(
            fontFamily: Static.abhayaLibrefont,
            fontSize: (MediaQuery.of(context).size.width / 430) * 33
           ),
           textAlign: TextAlign.center,
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Text("Choose the role you want to register to in the application",
             style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w400,
              fontSize: (MediaQuery.of(context).size.width / 430) * 18,
              color:Static.lightcolor
             ),
             textAlign: TextAlign.center,
             ),
           ),
          const Buttonpart(),
          ],
        ),
      ),
    );
  }
}