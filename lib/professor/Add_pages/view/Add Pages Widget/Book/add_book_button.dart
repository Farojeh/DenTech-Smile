import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBookButton extends StatelessWidget {
  const AddBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);
    double vertical = Static.getheight(context, 30.0);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(22),
        color: Colors.white.withOpacity(0),

        // BlocListener لسماع رسائل النجاح أو الفشل
        child: BlocListener<PageCubit, PageState>(
          listener: (context, state) {
            if (state is PageFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
            if (state is PageSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("File uploaded successfully ✅")),
              );
            }
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Styles.basicColor,
            ),
            onPressed: () {
              context.read<PageCubit>().storePdf();
            },
            child: Text(
              'Add Book',
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
      ),
    );
  }
}
