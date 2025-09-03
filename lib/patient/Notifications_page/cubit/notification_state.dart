part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class Notificationfailure extends NotificationState {
  final String errormessage;

  Notificationfailure({required this.errormessage});
}

final class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationSuccess({required this.notifications});
}
