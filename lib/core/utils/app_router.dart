import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_config_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/illness_cubit_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/information_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/medican_cubit.dart';
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
import 'package:dentech_smile/patient/patient.dart';
import 'package:dentech_smile/professor/professor.dart';
import 'package:dentech_smile/student/student.dart';
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
  static const patienthome = "/PatientHome";
  static const studenthome = "/StudentHome";
  static const professor = "/ProfessorHome";

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
          builder: (context, state) {
            final patient = state.extra as bool? ?? false;
            return BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
              child: LogInView(
                patient: patient,
              ),
            );
          }),
      GoRoute(
        path: verifyPage,
        builder: (context, state) {
          final isFromRegister = state.extra as bool? ?? false;
          return BlocProvider<VerifyCubit>(
            create: (context) => VerifyCubit(),
            child: VerifyPage(fromregister: isFromRegister),
          );
        },
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
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<DataPatientCubit>(
              create: (context) => DataPatientCubit(),
            ),
            BlocProvider<IllnessCubitCubit>(
              create: (context) => IllnessCubitCubit(),
            ),
            BlocProvider<InformationCubit>(
              create: (context) => InformationCubit(),
            ),
            BlocProvider<MedicanCubit>(
              create: (context) => MedicanCubit(),
            ),
            BlocProvider<DataPatientConfigCubit>(
              create: (context) => DataPatientConfigCubit(),
            ),
          ],
          child: const DatePatient(),
        ),
      ),
      GoRoute(
        path: patienthome,
        builder: (context, state) => const Patient(),
      ),
      GoRoute(
        path: studenthome,
        builder: (context, state) => const Student(),
      ),
      GoRoute(
        path: professor,
        builder: (context, state) => const Professor(),
      ),
    ],
  );
}
