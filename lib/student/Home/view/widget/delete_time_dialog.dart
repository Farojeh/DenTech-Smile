import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';

class DeleteTimeDialog extends StatelessWidget {
  const DeleteTimeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/reject 1.png",
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "Do you want to delete today's appointments?",
                          style: TextStyle(
                              fontFamily: Static.arialRoundedMTfont,
                              fontSize: Static.getwieght(context, 17),
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () =>  Navigator.pop(context,false) ,
                          redbl: 10,
                          redbr: 10,
                          redtl: 10,
                          redtr: 10,
                          color:const Color(0xff46A1A7),
                          height: 36,
                          width: 85,
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                         const SizedBox(width: 20,),
                          CustomButton(
                            onPressed: () =>  Navigator.pop(context,true) ,
                          redbl: 10,
                          redbr: 10,
                          redtl: 10,
                          redtr: 10,
                          color:const Color(0xff46A1A7),
                          height: 36,
                          width: 85,
                          child: Text(
                            "Delete",
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white),
                          ))
                    ],
                  )
                ])));
  }
}
