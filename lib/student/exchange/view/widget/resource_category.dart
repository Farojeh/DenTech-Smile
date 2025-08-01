import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/add_resource_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceCategory extends StatefulWidget {
  const ResourceCategory({super.key});

  @override
  State<ResourceCategory> createState() => _ResourceCategoryState();
}

class _ResourceCategoryState extends State<ResourceCategory> {
  int selecteditem = 1;

  List<Map<String, dynamic>> type = [
    {"name": "Books and References", "id": 1},
    {"name": "Paper Lectures", "id": 2},
    {"name": "Medical Instruments", "id": 3},
    {"name": "General", "id": 4}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: Static.getwieght(context, 70)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: type.map((item) {
          return Row(
            children: [
              Radio<int>(
                value: item['id'],
                visualDensity: VisualDensity.compact, // يقلل الحجم الافتراضي
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                groupValue: selecteditem,
                activeColor: Static.basiccolor,
                onChanged: (val) {
                  setState(() {
                    selecteditem = val!;
                  });
                  BlocProvider.of<AddResourceCubit>(context)
                      .setcategory(selecteditem);
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item['name'],
                  style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
