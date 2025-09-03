import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/patient/Notifications_page/model/notification_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()){
    notification();
  }

  final apiService = getIt<ApiService>();

  Future<void> notification() async {
    emit(NotificationLoading());
    try {
      final response = await apiService.get(
        endPoint: "/notifications",
        token: true,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure = ServerFaliure.fromResponse(
          response.statusCode!,
          response.data,
        );
        emit(Notificationfailure(errormessage: failure.errorMessage));
      } else {
        final List<dynamic> data = response.data;
        final notifications =
            data.map((e) => NotificationModel.fromJson(e)).toList();

        emit(NotificationSuccess(notifications: notifications));
      }
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Notificationfailure(errormessage: failure.errorMessage));
      } else {
        emit(Notificationfailure(errormessage: error.toString()));
      }
    }
  }
}
