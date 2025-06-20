import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/view/data_patient.dart';
import 'package:dentech_smile/Auth/log_in/controller/cubit/login_cubit.dart';
import 'package:dentech_smile/Auth/log_in/view/login_view.dart';
import 'package:dentech_smile/Auth/on_boarding/controller/cubit/on_boarding_cubit.dart';
import 'package:dentech_smile/Auth/on_boarding/view/on_boarding.dart';
import 'package:dentech_smile/Auth/on_boarding/view/role_selection_page.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/reset_password_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/verify_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/view/reset_password_page.dart';
import 'package:dentech_smile/Auth/reset_password/view/verify_page.dart';
import 'package:dentech_smile/Auth/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:dentech_smile/Auth/sign_up/view/sign_up.dart';
import 'package:dentech_smile/Auth/splash_view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const welcomView = "/onBoarding";
  static const roleSelectionPage = "/roleSelectionPage";
  static const signUp = "/signUp";
  static const login = "/login";
  static const verifyPage = "/VerifyPage";
  static const resetpassword = "/ResetPassword";
  static const datapatient = "/datapatient";

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
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: const LogInView(),
        ),
      ),
      GoRoute(
        path: verifyPage,
        builder: (context, state) => BlocProvider<VerifyCubit>(
          create: (context) => VerifyCubit(),
          child: const VerifyPage(),
        ),
      ),
      GoRoute(
        path: resetpassword,
        builder: (context, state) => BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(),
          child: const ResetPasswordPge(),
        ),
      ),
      GoRoute(
        path: datapatient,
        builder: (context, state) => BlocProvider<DataPatientCubit>(
          create: (context) => DataPatientCubit(),
          child: const DatePatient(),
        ),
      ),
    ],
  );
}
