import 'package:flutter/material.dart';

class PatientDialog extends StatelessWidget {
  final String message;
  const PatientDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/check-mark.png',
                  width: 35 * MediaQuery.of(context).size.width / 430,
                  height: 35 * MediaQuery.of(context).size.height / 932,
                ),
                Expanded(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 100 * MediaQuery.of(context).size.width / 430,
              height: 38 * MediaQuery.of(context).size.height / 900,
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
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'موافق',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
