import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientDialog extends StatelessWidget {
  final String message;
  final int id;
  const PatientDialog({super.key, required this.message, required this.id});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/check-mark.png',
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDEFBE5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: Color(0xFF38A754),
                          width: 0.5,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (id != 0) {
                        await context.read<PatientCubit>().postAppointment(id);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      context.watch<ThemeCubit>().isArabic
                          ? Lang.arabLang["OK"]!
                          : Lang.enLang["OK"]!,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                id != 0
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 38,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFCEAEA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Color(0xFFE74C3C),
                                width: 0.5,
                              ),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(
                            context.watch<ThemeCubit>().isArabic
                                ? Lang.arabLang["NO"]!
                                : Lang.enLang["NO"]!,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Afacad',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
