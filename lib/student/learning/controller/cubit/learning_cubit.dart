import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/archive/model/achive.dart';
import 'package:dentech_smile/student/archive/model/internship.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  LearningCubit(String type) : super(LearningInitial()) {
    String t = "";
    int tid = 0;
    if (type == "Books and references") {
      t = "pdf";
      tid = 1;
    } else if (type == "YouTube videos") {
      t = "link";
      tid = 2;
    } else {
      t = "article";
      tid = 3;
    }
    initiallearn(t, tid);
  }


  final apiService = getIt<ApiService>();

  void initiallearn(String type, int tid) async {
    try {
      emit(LearningLoading());
      Map<String, String> data = {"type": type};
      Response response;
      response = await apiService.post(
          endPoint: "/show-educational-contents-bystage",
          data: data,
          token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Learningfailure(errormessage: failure.errorMessage));
        return;
      }
      List<dynamic> stagesJson = response.data["stages"];

      List<Internship> internships = stagesJson
          .map((stageJson) => Internship.setdata(tid, stageJson))
          .toList();

       List<Archive> selectArchive = internships[0].archives;
      emit(LearningSuccess(
          allinternships: internships, allarchives: selectArchive, select: 0));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Learningfailure(errormessage: failure.errorMessage));
      }
    }
  }

  void changeselect(int index) {
    final currentintership = (state as LearningSuccess).allinternships;
    List<Archive> selectArchive = currentintership[index].archives;
    emit(LearningSuccess(
        allarchives: selectArchive,
        select: index,
        allinternships: currentintership));
  }
}
