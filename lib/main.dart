import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? userInfo;
void main() async {
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
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => ProfessorHomeCubit()
            ..changeSelectedIndex(0)
            ..getWeeklySchedule(),
        ),
        BlocProvider(create: (context) => CaseCubit()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
