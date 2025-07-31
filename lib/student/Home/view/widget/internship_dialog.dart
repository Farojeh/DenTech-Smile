import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/model/add_appointment.dart';
import 'package:flutter/material.dart';

class InternShipDialog extends StatelessWidget {
  final AddAppointment item ;
  const InternShipDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                        margin: const EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "All InternShips in ${item.name}",
                          style: TextStyle(
                              fontFamily: Static.arialRoundedMTfont,
                              fontSize: Static.getwieght(context, 18),
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20 , top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: item.internship.map((e) => Container(
                            margin:const EdgeInsets.symmetric(vertical: 5),
                            child: Text("-  $e", 
                            style: TextStyle(
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18
                            ),
                            ),
                          )).toList(),
                        ),
                      )
                ])));
  }
}
