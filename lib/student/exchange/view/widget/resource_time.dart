import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ResourceTime extends StatefulWidget {
  const ResourceTime({super.key});

  @override
  State<ResourceTime> createState() => _ResourceTimeState();
}

class _ResourceTimeState extends State<ResourceTime> {
  String date = "yyyy-mm-dd";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/add-event 1.png",
                    height: 25,
                    width: 25,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add a new appointment",
                    style: TextStyle(
                        fontFamily: Static.arialRoundedMTfont,
                        fontSize: Static.getwieght(context, 18),
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        fontFamily: Static.arialRoundedMTfont,
                        fontSize: Static.getwieght(context, 20),
                        color: Colors.black),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 18),
                    ),
                  ),
                  InkWell(
                    overlayColor:
                        MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                    onTap: () async {
                      final DateTime now = DateTime.now();
                      final DateTime lastDate =
                          DateTime(now.year + 1, now.month, now.day);
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: lastDate,
                      );
                      String twoDigits(int n) => n.toString().padLeft(2, '0');
                      if (picked != null) {
                        if (!context.mounted) return;
                        setState(() {
                          date =
                            "${twoDigits(picked.day)}-${twoDigits(picked.month)}-${picked.year.toString()}";
                        });
                      }
                    },
                    child: Text(
                      "Click here",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xfffF34966),
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwieght(context, 16),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                child: CustomButton(
                    color: const Color(0xff46A1A7),
                    colorside: const Color(0xff46A1A7),
                    redbl: 15,
                    redbr: 15,
                    redtl: 15,
                    redtr: 15,
                    height: (MediaQuery.of(context).size.height / 932) * 48,
                    width: MediaQuery.of(context).size.width * 0.3,
                    onPressed: () {
                      if (date == "yyyy-mm-dd") {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context).pop(date);
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w700,
                          fontSize:
                              (MediaQuery.of(context).size.width / 430) * 17,
                          color: Colors.white),
                    )),
              ),
            ],
          )),
    );
  }
}
