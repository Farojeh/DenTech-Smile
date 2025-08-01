import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/add_resource_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/resource_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourcePeriod extends StatefulWidget {
  const ResourcePeriod({super.key});

  @override
  State<ResourcePeriod> createState() => _ResourcePeriodState();
}

class _ResourcePeriodState extends State<ResourcePeriod> {
  int selecteditem = 1;
  String startdate = "Click here";
  String enddate = "Click here";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: Static.getwieght(context, 70)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Radio<int>(
                  value: 1,
                  visualDensity: VisualDensity.compact, // يقلل الحجم الافتراضي
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  groupValue: selecteditem,
                  activeColor: Static.basiccolor,
                  onChanged: (val) {
                    setState(() {
                      selecteditem = val!;
                    });
                    BlocProvider.of<AddResourceCubit>(context)
                        .setdate(selecteditem);
                  },
                ),
                const SizedBox(width: 8),
                InkWell(
                  overlayColor:
                      MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                  onTap: () async {
                    String? result = await showDialog(
                        context: context,
                        builder: (context) => const ResourceTime());
                    if (result != null && result != "yyyy-mm-dd") {
                      setState(() {
                        startdate = result;
                      });
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<AddResourceCubit>(context)
                          .setstartdate(startdate);
                    }
                  },
                  child: Text(
                    startdate,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 16),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Color(0xff328F96),
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  overlayColor:
                      MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                  onTap: () async {
                    String? result = await showDialog(
                        context: context,
                        builder: (context) => const ResourceTime());
                    if (result != null && result != "yyyy-mm-dd") {
                      setState(() {
                        enddate = result;
                      });
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<AddResourceCubit>(context)
                          .setenddate(enddate);
                    }
                  },
                  child: Text(
                    enddate,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 16),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio<int>(
                  value: 2,
                  visualDensity: VisualDensity.compact, // يقلل الحجم الافتراضي
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  groupValue: selecteditem,
                  activeColor: Static.basiccolor,
                  onChanged: (val) {
                    setState(() {
                      selecteditem = val!;
                    });
                    BlocProvider.of<AddResourceCubit>(context)
                        .setdate(selecteditem);
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "None",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
