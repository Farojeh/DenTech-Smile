import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  String otp = "";
  String mainotp = "6789";

  void setverifyotp({required String n}) {
    otp = n;
  }

  Future<void> verify() async {
    print("************************ otp is $otp **********************");
    emit(VerifyLoading());
    Future.delayed(const Duration(seconds: 3), () {
      if (mainotp == otp) {
        emit(VerifySuccess());
      } else {
        emit(VerifyFailure(errorMessage: "otp is not true"));
      }
    });
  }
}
