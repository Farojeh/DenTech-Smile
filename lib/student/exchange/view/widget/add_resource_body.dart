import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/add_resource_cubit.dart';
import 'package:dentech_smile/student/exchange/view/widget/custom_resource_field.dart';
import 'package:dentech_smile/student/exchange/view/widget/resource_category.dart';
import 'package:dentech_smile/student/exchange/view/widget/resource_image.dart';
import 'package:dentech_smile/student/exchange/view/widget/resource_period.dart';
import 'package:dentech_smile/student/exchange/view/widget/resource_title.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddResourceBody extends StatefulWidget {
  const AddResourceBody({super.key});

  @override
  State<AddResourceBody> createState() => _AddResourceBodyState();
}

class _AddResourceBodyState extends State<AddResourceBody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          const ResourceTitle(
              name: "Resource’s Name", image: "assets/images/signature 1.png"),
          Form(
              autovalidateMode: autovalidateMode,
              key: formkey,
              child: const CustomResourceField()),
          const ResourceTitle(
              name: "Resource’s Category", image: "assets/images/widget 1.png"),
          const ResourceCategory(),
          const ResourceTitle(
              name: "Loan period", image: "assets/images/reservation 1.png"),
          const ResourcePeriod(),
          const ResourceTitle(
              name: "Resource’s picture",
              image: "assets/images/image (1) 1.png"),
          const ResourceImage(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4),
            child: CustomButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      formkey.currentState!.save();
                      BlocProvider.of<AddResourceCubit>(context).save();
                    } catch (error) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(CustomSnackBar().customSnackBar(
                            'Oops',
                            error.toString(),
                            ContentType.failure));
                    }
                  }
                },
                color: Static.basiccolor,
                redbl: 15,
                redbr: 15,
                redtl: 15,
                redtr: 15,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Text(
                  "Add Resource",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 18),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
