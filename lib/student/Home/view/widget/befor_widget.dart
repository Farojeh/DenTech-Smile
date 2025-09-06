import 'dart:io';

import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/add_image_cubit.dart';
import 'package:dentech_smile/student/Home/controller/cubit/state_page_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeforWidget extends StatefulWidget {
  final String appointmentid;
  final List<String> images;
  const BeforWidget(
      {super.key, required this.images, required this.appointmentid});

  @override
  State<BeforWidget> createState() => _BeforWidgetState();
}

class _BeforWidgetState extends State<BeforWidget> {
  List<int> ind = [];
  String res = "";
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddImageCubit, AddImageState>(
      listener: (context, state) {
        if (state is AddImagefailure) {
          Static.failure(context, state.errormessage);
        } else if (state is AddImagesuccess) {
          ind.add(BlocProvider.of<StatePageCubit>(context).setbeforimage(res));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTitle(
              image: "assets/images/befor.png",
              title: "Before treatment",
              more: "add image",
              ismore: true,
              onTapfun: () async {
                String? result = await Static.pickeimageprofile(context);
                if (result != null) {
                  if (!context.mounted) return;
                  // print("image exist");
                  await BlocProvider.of<AddImageCubit>(context).saveimage(
                      widget.appointmentid, "before-treatment", result);
                  if (!context.mounted) return;
                  res = result;
                }
              }),
          Container(
              height: Static.gethieght(context, 100),
              margin: EdgeInsets.only(
                left: Static.getwieght(context, 40),
                top: Static.gethieght(context, 25),
                bottom: Static.gethieght(context, 30),
              ),
              child: BlocBuilder<AddImageCubit, AddImageState>(
                builder: (context, state) {
                  if (state is AddImageLoading) {
                    return SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Static.basiccolor,
                        ));
                  }
                  return widget.images.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) => InkWell(
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.white.withOpacity(0)),
                                onTap: () => Static.showimage(
                                    context, widget.images[index] ,ind.contains(index) ),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  height: Static.gethieght(context, 100),
                                  width: Static.getwieght(context, 109),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: !ind.contains(index)
                                        ? Image.network(
                                            "${Static.urlimagewithoutstorage}${widget.images[index]}",
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(File(widget.images[index]),
                                            fit: BoxFit.cover),
                                  ),
                                ),
                              ))
                      : Center(
                          child: Text(
                            "No Images yet",
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontWeight: FontWeight.w400,
                                color: Static.lightcolor2,
                                fontSize: 16),
                          ),
                        );
                },
              )),
        ],
      ),
    );
  }
}
