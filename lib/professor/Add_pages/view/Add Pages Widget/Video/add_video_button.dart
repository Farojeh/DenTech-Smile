import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVideoButton extends StatelessWidget {
  final BuildContext oldContext;
  final TextEditingController nameController;
  final TextEditingController linkController;

  const AddVideoButton({
    super.key,
    required this.oldContext,
    required this.nameController,
    required this.linkController,
  });

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);
    double vertical = Static.getheight(context, 20.0);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        color: Colors.white.withOpacity(0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Styles.basicColor,
          ),
          onPressed: () async {
            await context.read<PageCubit>().storeVideo();
            Static.showCustomSnackbar(
              oldContext,
              oldContext.read<PageCubit>().message,
            );
          },
          child: Text(
            'Add Video',
            style: TextStyle(
              fontFamily: 'ArialRounded',
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: Static.getwidth(context, 20),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
