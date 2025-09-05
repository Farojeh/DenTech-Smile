import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogEvaluateProfessor extends StatelessWidget {
  final int sessionId;
  const DialogEvaluateProfessor({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwieght(context, 40);
    double vertical = Static.gethieght(context, 25);
    double horizontal2 = Static.getwieght(context, 24.0);
    double vertical2 = Static.gethieght(context, 16.0);
    return BlocConsumer<CaseCubit, CaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CaseLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: Static.getwieght(context, 350),
              height: Static.gethieght(context, 480),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Evaluate The State',
                      style: TextStyle(
                        fontFamily: 'ArialRounded',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: Static.getwieght(context, 20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Static.gethieght(context, 10)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/star.png',
                          height: Static.gethieght(context, 25),
                          width: Static.getwieght(context, 25),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: Static.getwieght(context, 10)),
                        Text(
                          'Enter Degree',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Afacad',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwieght(context, 20),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Static.gethieght(context, 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Static.getwieght(context, 140),
                          height: Static.gethieght(context, 35),
                          child: TextFormField(
                            onChanged: (value) {
                              context.read<CaseCubit>().score =
                                  value.toString();
                            },
                            controller: context.read<CaseCubit>().controller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.28),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.28),
                                  width: 1,
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(244, 244, 244, 1),
                            ),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Static.gethieght(context, 14)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/chat.png',
                          height: Static.gethieght(context, 25),
                          width: Static.getwieght(context, 25),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: Static.getwieght(context, 10)),
                        Text(
                          'Enter a comment on the status',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Afacad',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwieght(context, 20),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: vertical2,
                        horizontal: horizontal2,
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          context.read<CaseCubit>().comment = value;
                        },
                        controller: context.read<CaseCubit>().controller2,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: horizontal,
                            vertical: vertical,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(244, 244, 244, 1),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/folder.png',
                          height: Static.gethieght(context, 25),
                          width: Static.getwieght(context, 25),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: Static.getwieght(context, 10)),
                        Text(
                          'Do you want to archive the status?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Afacad',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwieght(context, 17),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Static.gethieght(context, 10)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: context.read<CaseCubit>().isArchived,
                          onChanged: (value) {
                            context.read<CaseCubit>().changeCheckedArchive(
                                  value!,
                                );
                          },
                        ),
                        Text(
                          'Archive the case',
                          style: TextStyle(
                            fontFamily: 'Afacad',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: Static.getwieght(context, 20),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: Static.gethieght(context, 12)),
                    ElevatedButton(
                      onPressed: () async {
                        await context.read<CaseCubit>().postEvaluate(sessionId);
                        Static.showCustomSnackbar(
                          context,
                          context.read<CaseCubit>().message,
                        );
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(140, 45),
                        backgroundColor: Styles.basicColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.black, width: 0.5),
                        ),
                      ),
                      child: Text(
                        'Evaluate',
                        style: TextStyle(
                          fontFamily: 'ArialRounded',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: Static.getwieght(context, 18),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
