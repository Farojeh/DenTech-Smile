import 'package:dentech_smile/Auth/data_patient/controller/cubit/information_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/information_field.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
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
  String? hieght = "";
  String? wieght = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, trstate) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            InformationField(
              image: "assets/images/growing-up.png",
              title:trstate.isEn? "Enter your Age":"ادخل عمرك",
              field: SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: CustomTextField(
                  inputborder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 0.4)),
                  isEnglish:trstate.isEn? true:false,
                  height: (MediaQuery.of(context).size.height / 932) * 60,
                  iscoupon: true,
                  onsaved: (data) {
                    age = data;
                    BlocProvider.of<InformationCubit>(context).setage(a: age!);
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
              image: "assets/images/height.png",
              title:trstate.isEn? "Enter your Hieght":"ادخل طولك",
              field: SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: CustomTextField(
                  inputborder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 0.4)),
                  isEnglish:trstate.isEn? true:false,
                  height: (MediaQuery.of(context).size.height / 932) * 60,
                  iscoupon: true,
                  onsaved: (data) {
                    hieght = data;
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
              title:trstate.isEn? "Enter your Wieght":"ادخل وزنك",
              field: SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: CustomTextField(
                  inputborder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 0.4)),
                  isEnglish:trstate.isEn? true:false,
                  height: (MediaQuery.of(context).size.height / 932) * 60,
                  iscoupon: true,
                  onsaved: (data) {
                    wieght = data;
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
