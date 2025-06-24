import 'package:dentech_smile/Auth/data_patient/controller/cubit/medican_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicanBody extends StatelessWidget {
  const MedicanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 932) * 290,
          width: (MediaQuery.of(context).size.width / 430) * 360,
        ),
        BlocBuilder<MedicanCubit, MedicanState>(
          builder: (context, state) {
            if (state is MedicanImagesUpdated) {
              int x = state.images.length;
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.025,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: x == 1 ? 30 : (x == 2 ? 35 : 27),
                    horizontal: x == 1 ? 40 : (x == 2 ? 30 : 20)),
                height: (MediaQuery.of(context).size.height / 932) * 250,
                width: (MediaQuery.of(context).size.width / 430) * 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.5, color: Static.basiccolor),
                ),
                alignment: Alignment.topCenter,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: x == 1 ? 1 : (x == 2 ? 2 : 3),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: x == 1
                        ? 300 / 180
                        : (x == 2 ? (300 / 2 - 10) / 180 : 85 / 71),
                  ),
                  itemCount: x,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 0.5, color: Colors.black87)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                            Image.file(state.images[index], fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.025,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 40,
                ),
                height: (MediaQuery.of(context).size.height / 932) * 250,
                width: (MediaQuery.of(context).size.width / 430) * 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.5, color: Static.basiccolor),
                ),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/image (2).png",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.contain,
                ),
              );
            }
          },
        ),
        Positioned(
            right: MediaQuery.of(context).size.width * 0.13,
            child: InkWell(
              onTap: () => BlocProvider.of<MedicanCubit>(context).pickImage(),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Static.basiccolor, shape: BoxShape.circle),
                child: Image.asset("assets/images/image.png"),
              ),
            ))
      ],
    );
  }
}
