import 'package:dentech_smile/Auth/data_patient/controller/cubit/information_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/information_field.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomInformationFields extends StatefulWidget {
  const CustomInformationFields({super.key});

  @override
  State<CustomInformationFields> createState() =>
      _CustomInformationFieldsState();
}

class _CustomInformationFieldsState extends State<CustomInformationFields> {
  String? age = "";
  double? hieght ;
  int? wieght;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, trstate) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            InformationField(
              image: "assets/images/growing-up.png",
              title: trstate.isEn ? "Enter your Age" : "ادخل عمرك",
              field: InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  String twoDigits(int n) => n.toString().padLeft(2, '0');
                  if (picked != null) {
                    if (!context.mounted) return;
                    BlocProvider.of<InformationCubit>(context).setage(
                        d: twoDigits(picked.day),
                        m: twoDigits(picked.month),
                        y: picked.year.toString());
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: (MediaQuery.of(context).size.height / 932) * 40,
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black26, width: 0.4)),
                  alignment: Alignment.center,
                  child: BlocBuilder<InformationCubit, InformationState>(
                    builder: (context, state) {
                      if (state is InformationDate) {
                        return Text(
                          state.date,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: Static.afacadfont,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Divider(
                  color: Colors.black54,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InformationField(
              image: "assets/images/height.png",
              title: trstate.isEn ? "Enter your Hieght" : "ادخل طولك",
              field: SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: CustomTextField(
                  inputborder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 0.4)),
                  isEnglish: trstate.isEn ? true : false,
                  height: (MediaQuery.of(context).size.height / 932) * 60,
                  isint: true,
                  onsaved: (data) {
                    hieght = double.parse(data!);
                    BlocProvider.of<InformationCubit>(context)
                        .sethieght(h: hieght!);
                  },
                  hint: "",
                  backgroundcolor: const Color(0xffF5F5F5),
                  hintsize: (MediaQuery.of(context).size.width / 430) * 10,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Divider(
                  color: Colors.black54,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InformationField(
              image: "assets/images/scale.png",
              title: trstate.isEn ? "Enter your Wieght" : "ادخل وزنك",
              field: SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: CustomTextField(
                  inputborder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 0.4)),
                  isEnglish: trstate.isEn ? true : false,
                  height: (MediaQuery.of(context).size.height / 932) * 60,
                  isint: true,
                  onsaved: (data) {
                    wieght = int.parse(data!);
                    BlocProvider.of<InformationCubit>(context)
                        .setwieght(w: wieght!);
                  },
                  hint: "",
                  backgroundcolor: const Color(0xffF5F5F5),
                  hintsize: (MediaQuery.of(context).size.width / 430) * 10,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
