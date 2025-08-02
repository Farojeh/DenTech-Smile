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
import 'package:dentech_smile/patient/Appointments_doctor/AppointmentsDoctorPage.dart';
import 'package:dentech_smile/patient/Appointments_page/view/AppointmentsOralPage.dart';
import 'package:dentech_smile/patient/Available_doctor_page/model/argument_model.dart';
import 'package:dentech_smile/patient/Home_page/model/oral_doctor_model.dart';
import 'package:dentech_smile/professor/professor.dart';
import 'package:dentech_smile/student/Home/controller/cubit/appointment_page_cubit.dart';
import 'package:dentech_smile/student/Home/controller/cubit/home_cubit.dart';
import 'package:dentech_smile/student/Home/view/appointment_page.dart';
import 'package:dentech_smile/student/Home/view/state_page.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/add_resource_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_exchanges_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resources_cubit.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/resource_view_cubit.dart';
import 'package:dentech_smile/student/exchange/view/add_resource.dart';
import 'package:dentech_smile/student/exchange/view/exchange_page.dart';
import 'package:dentech_smile/student/exchange/view/my_exchanges_page.dart';
import 'package:dentech_smile/student/exchange/view/my_resources.dart';
import 'package:dentech_smile/student/exchange/view/resource_view_page.dart';
import 'package:dentech_smile/student/learning/controller/cubit/learning_cubit.dart';
import 'package:dentech_smile/student/learning/model/artical.dart';
import 'package:dentech_smile/student/learning/views/articale_page.dart';
import 'package:dentech_smile/student/learning/views/learn.dart';
import 'package:dentech_smile/student/learning/views/learning_details_page.dart';
import 'package:dentech_smile/student/main_tap/controller/cubit/tab_cubit_cubit.dart';
import 'package:dentech_smile/student/main_tap/view/main_tab_view.dart';
import 'package:dentech_smile/student/portfolio/controller/cubit/portfolio_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dentech_smile/patient/About_app_page/AboutAppPage.dart';
import 'package:dentech_smile/patient/Archive_page/model/ArchiveModel.dart';
import 'package:dentech_smile/patient/Archive_page/view/archive_body.dart';
import 'package:dentech_smile/patient/Available_doctor_page/view/available_doctor_body.dart';
import 'package:dentech_smile/patient/Home_page/view/patient_home_page.dart';
import 'package:dentech_smile/patient/Notifications_page/view/NotificationsPage.dart';
import 'package:dentech_smile/patient/Profile_page/view/profile_page.dart';
import 'package:dentech_smile/patient/Case_page/view/CasePage.dart';

abstract class AppRouter {
  static const welcomView = "/onBoarding";
  static const roleSelectionPage = "/roleSelectionPage";
  static const signUp = "/signUp";
  static const login = "/login";
  static const verifyPage = "/VerifyPage";
  static const resetpassword = "/ResetPassword";
  static const datapatient = "/datapatient";
  static const patienthome = "/PatientHome";
  static const professor = "/ProfessorHome";
  static const mainTabView = "/mainTabView";
  static const statePage = "/StatePage";
  static const kHomeView = '/homeView';
  static const karchive = '/archive';
  static const available = '/available';
  static const profile = '/profile';
  static const appointments = '/appointments';
  static const status = '/status';
  static const appointmentsDoctor = '/appointmentsDoctor';
  static const notifications = '/notifications';
  static const aboutApp = '/aboutApp';
  static const appointmentpage = "/appointmentpage";
  static const learning = "/Learning";
  static const learningdetails = "/Learningdetails";
  static const artical = "/artical";
  static const exchangepage = "/exchangepage";
  static const addresource = "/addresource";
  static const resourcepage = "/resourcepage";
  static const myexchange = "/myexchange";
  static const myresourcespage = "/myresourcespage";

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
        path: professor,
        builder: (context, state) => const Professor(),
      ),
      GoRoute(
        path: mainTabView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<TabCubitCubit>(
              create: (context) => TabCubitCubit(),
            ),
            BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(),
            ),
            BlocProvider<PortfolioCubit>(
              create: (context) => PortfolioCubit(),
            ),
          ],
          child: const MainTabView(),
        ),
      ),
      GoRoute(
          path: statePage,
          builder: (context, state) {
            final data = state.extra as Map<String, String>?;

            final name = data?['name'] ?? 'No name';
            final start = data?['start'] ?? 'No start';
            final end = data?['end'] ?? 'No end';

            return StatePage(name: name, start: start, end: end);
          }),
      GoRoute(
        path: appointmentpage,
        builder: (context, state) => BlocProvider<AppointmentPageCubit>(
          create: (context) => AppointmentPageCubit(),
          child: const AppointmentPage(),
        ),
      ),
      GoRoute(
        path: learning,
        builder: (context, state) => const Learnpage(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const PatientHomePage(),
      ),
      GoRoute(path: karchive, builder: (context, state) => const ArchivePage()),
      GoRoute(
          path: available,
          builder: (context, state) => const AvailableDoctorPage()),
      GoRoute(path: profile, builder: (context, state) => const ProfilePage()),
      GoRoute(
        path: appointments,
        builder: (context, state) {
          final student = state.extra as Students;
          return AppointmentsOralPage(student: student);
        },
      ),
      GoRoute(
        path: appointmentsDoctor,
        builder: (context, state) {
          final args = state.extra as AppointmentArgs;
          return AppointmentsDoctorPage(
            student: args.student,
            index: args.index,
          );
        },
      ),
      GoRoute(
        path: AppRouter.status,
        builder: (context, state) {
          final student = state.extra as StudentsArchive;
          return CasePage(student: student);
        },
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: aboutApp,
        builder: (context, state) => const AboutAppPage(),
      ),
      GoRoute(
          path: learningdetails,
          builder: (context, state) {
            final Map<String, dynamic> data =
                state.extra as Map<String, dynamic>;
            final String title = data["title"];
            final int type = data["type"];
            return BlocProvider<LearningCubit>(
              create: (context) => LearningCubit(title),
              child: LearningDetailsPage(
                title: title,
                type: type,
              ),
            );
          }),
      GoRoute(
          path: artical,
          builder: (context, state) {
            final artical = state.extra as Artical;
            return ArticalePage(
              artical: artical,
            );
          }),
      GoRoute(
          path: exchangepage,
          builder: (context, state) => const ExchangePage()),
      GoRoute(
          path: addresource,
          builder: (context, state) => BlocProvider<AddResourceCubit>(
                create: (context) => AddResourceCubit(),
                child: const AddResource(),
              )),
      GoRoute(
          path: resourcepage,
          builder: (context, state) {
            String title = state.extra as String;
            return BlocProvider<ResourceViewCubit>(
              create: (context) => ResourceViewCubit(title),
              child: ResourceViewPage(
                type: title,
              ),
            );
          }),
      GoRoute(
          path: myexchange,
          builder: (context, state) => BlocProvider<MyExchangesCubit>(
                create: (context) => MyExchangesCubit(),
                child: const MyExchangesPage(),
              )),
      GoRoute(
        path: myresourcespage,
        builder: (context, state) => BlocProvider<MyResourcesCubit>(
          create: (context) => MyResourcesCubit(),
          child: const MyResourcesPage(),
        ),
      ),
    ],
  );
}
