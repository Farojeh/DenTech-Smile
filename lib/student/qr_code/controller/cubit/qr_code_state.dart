part of 'qr_code_cubit.dart';

@immutable
sealed class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}
final class QrCodeLoading extends QrCodeState {}
final class QrCodefailure extends QrCodeState {
  final String errormessage ;

  QrCodefailure({required this.errormessage});
}

final class QrCodeSuccess extends QrCodeState {
   final String qrCode ;

  QrCodeSuccess({required this.qrCode});
}
