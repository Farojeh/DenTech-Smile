part of 'qr_code_cubit.dart';

@immutable
sealed class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}
final class QrCodeSuccess extends QrCodeState {
   final String qrCode ;

  QrCodeSuccess({required this.qrCode});
}
