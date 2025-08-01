import 'dart:io';

import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/add_resource_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceImage extends StatefulWidget {
  const ResourceImage({super.key});

  @override
  State<ResourceImage> createState() => _ResourceImageState();
}

class _ResourceImageState extends State<ResourceImage> {
  String? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
      onTap: () async {
        String? result = await Static.pickeimageprofile(context);
        if (result != null) {
          setState(() {
            image = result;
          });
          if (image != null) {
            // ignore: use_build_context_synchronously
            BlocProvider.of<AddResourceCubit>(context).setimage(image!);
          }
        }
      },
      child: Container(
        height: Static.gethieght(context, 170),
        width: Static.getwieght(context, 280),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff328F96), width: 0.5),
            borderRadius: BorderRadius.circular(30)),
        child: image == null
            ? Image.asset(
                "assets/images/Image folder-rafiki 1.png",
                height: Static.gethieght(context, 155),
                width: Static.gethieght(context, 155),
                fit: BoxFit.contain,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.file(File(image!), fit: BoxFit.cover)),
      ),
    );
  }
}
