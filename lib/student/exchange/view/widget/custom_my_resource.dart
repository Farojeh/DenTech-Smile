import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

import 'package:dentech_smile/student/exchange/model/resource.dart';

class CustomMyResource extends StatelessWidget {
  final Resource item;
  final void Function()? onTap;
  const CustomMyResource({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 30, bottom: 20),
        height:item.name.length>23?Static.gethieght(context, 130) :Static.gethieght(context, 120),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Static.lightcolor2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.network(
                "${Static.urlimage}${item.image}",
                height:item.name.length>23?Static.gethieght(context, 130) :Static.gethieght(context, 120),
                width: Static.getwieght(context, 120),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.52,
                  child: Text(
                    item.name,
                    style: TextStyle(
                        fontFamily: Static.arialRoundedMTfont,
                        fontSize: Static.getwieght(context, 18),
                        color: Colors.black),
                  ),
                ),
                Text(
                  item.type,
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 16),
                      color: Static.lightcolor2),
                ),
                Text(
                  item.status
                      ? "Status : Reservation "
                      : "Status : Not Reservation ",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 16),
                      color: Static.lightcolor2),
                ),
                Text(
                  "${item.startdate} to ${item.enddate}",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 16),
                      color: Static.lightcolor2),
                ),
                const SizedBox(
                  height: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
