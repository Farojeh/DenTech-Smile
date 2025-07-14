import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? userInfo;
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   userInfo = await SharedPreferences.getInstance();
  setupServiceLocator();
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TranslationCubit>(create: (context) => TranslationCubit()),
      ],
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
