import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/archive/model/archive_two.dart';
import 'package:dentech_smile/student/archive/model/internship_two.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial()) {
    initialArchive();
  }

  final apiService = getIt<ApiService>();

  Future<void> initialArchive() async {
    try {
      emit(Archiveloading());
      Response response;
      response =
          await apiService.get(endPoint: "/view-emergency-cases", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Archivefailure(errormessage: failure.errorMessage));
        return;
      }
      List<dynamic> stagesJson = response.data;
      List<InternshipTwo> internships = stagesJson
          .map((stageJson) => InternshipTwo.setdatafromarchive(stageJson))
          .toList();
      List<ArchiveTwo> selectArchive = internships[0].archives;
      emit(ArchiveSuccess(
          allinternships: internships, allarchives: selectArchive, select: 0));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Archivefailure(errormessage: failure.errorMessage));
      }
    }
  }

  void changeselect(int index) {
    final currentintership = (state as ArchiveSuccess).allinternships;
    List<ArchiveTwo> selectArchive = currentintership[index].archives;
    emit(ArchiveSuccess(
        allarchives: selectArchive,
        select: index,
        allinternships: currentintership));
  }
}
