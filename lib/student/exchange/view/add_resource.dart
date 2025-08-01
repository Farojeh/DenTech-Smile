import 'package:dentech_smile/student/exchange/view/widget/add_resource_back.dart';
import 'package:dentech_smile/student/exchange/view/widget/add_resource_body.dart';
import 'package:flutter/material.dart';

class AddResource extends StatelessWidget {
  const AddResource({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddResourceBack(screen: AddResourceBody());
  }
}