import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Add_pages/controller/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookLoadBody extends StatelessWidget {
  const BookLoadBody({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 40);
    double vertical = Static.getheight(context, 10);

    return BlocConsumer<PageCubit, PageState>(
      listener: (context, state) {
        if (state is PageSuccess &&
            context.read<PageCubit>().message.isNotEmpty) {
          Static.showCustomSnackbar(context, context.read<PageCubit>().message);
        } else if (state is PageFailure) {
          Static.showCustomSnackbar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = context.read<PageCubit>();

        return Container(
          height: Static.getheight(context, 320),
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: Static.getwidth(context, 10),
                    height: Static.getheight(context, 10),
                    decoration: const BoxDecoration(
                      color: Styles.basicColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: Static.getwidth(context, 16)),
                  Text(
                    'Please upload the PDF file.',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: Static.getwidth(context, 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: InkWell(
                  onTap: () {
                    cubit.getPdfFile();
                  },
                  child: Container(
                    height: Static.getheight(context, 208),
                    width: Static.getwidth(context, 300),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 1),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/download.png',
                            height: Static.getheight(context, 100),
                            width: Static.getwidth(context, 100),
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cubit.pdfResult != null
                                ? "PDF Selected ✅"
                                : "Choose PDF",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
