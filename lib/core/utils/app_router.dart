import 'package:dentech_smile/Auth/on_boarding/controller/cubit/on_boarding_cubit.dart';
import 'package:dentech_smile/Auth/on_boarding/view/on_boarding.dart';
import 'package:dentech_smile/Auth/on_boarding/view/role_selection_page.dart';
import 'package:dentech_smile/Auth/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:dentech_smile/Auth/sign_up/view/sign_up.dart';
import 'package:dentech_smile/Auth/splash_view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const welcomView = "/onBoarding";
  static const roleSelectionPage = "/roleSelectionPage";
  static const signUp = "/signUp";

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: welcomView,
        builder: (context, state) => BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit(),
          child: const Onboarding(),
        ),
      ),
      GoRoute(
        path: roleSelectionPage,
        builder: (context, state) => const RoleSelectionPage(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
          child: const SignUp(),
        ),
      ),
    ],
  );
}
