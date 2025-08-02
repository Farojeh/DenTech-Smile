import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'add_resource_state.dart';

class AddResourceCubit extends Cubit<AddResourceState> {
  AddResourceCubit()
      : super(AddResourceInitial(
          name: "",
          category: 1,
          date: 2,
          startdate: "none",
          enddate: "none",
          image: "none",
        ));

  String n = "";

  void setname(String name) {
    emit(state.copyWith(name: name));
  }

  void setcategory(int category) {
    emit(state.copyWith(category: category));
  }

  void setdate(int date) {
    emit(state.copyWith(date: date));
  }

  void setstartdate(String startdate) {
    emit(state.copyWith(startdate: startdate));
  }

  void setenddate(String enddate) {
    emit(state.copyWith(enddate: enddate));
  }

  void setimage(String image) {
    emit(state.copyWith(image: image));
  }

  final apiService = getIt<ApiService>();

  void save() async {
    if (state.date == 1) {
      if (state.startdate == "none" || state.enddate == "none") {
        throw "you must input start and end date";
      }
    }
    if (state.image == "none") {
      throw "you must select image";
    }

    String cat;
    if (state.category == 1) {
      cat = "Books_and_References";
    } else if (state.category == 2) {
      cat = "Paper_lectures";
    } else if (state.category == 3) {
      cat = "Medical_instruments";
    } else {
      cat = "General";
    }

    emit(AddResourceLoading(
        name: state.name,
        category: state.category,
        date: state.date,
        startdate: state.startdate,
        enddate: state.enddate,
        image: state.image));

    FormData formData = FormData();
    if (state.date == 1) {
      formData.fields.addAll([
        MapEntry('resource_name', state.name),
        MapEntry('category', cat),
        MapEntry('loan_start_date', state.startdate),
        MapEntry('loan_end_date', state.enddate),
      ]);
    } else {
      formData.fields.addAll([
        MapEntry('resource_name', state.name),
        MapEntry('category', cat),
      ]);
    }
    formData.files.add(
      MapEntry(
        'image_path',
        await MultipartFile.fromFile(
          state.image,
          filename: state.image.split('/').last,
        ),
      ),
    );
    Response response;
    try {
      response = await apiService.postfiles(
          endPoint: "/add-resource", data: formData, tokenbool: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(AddResourcefailure(
            name: state.name,
            category: state.category,
            date: state.date,
            startdate: state.startdate,
            enddate: state.enddate,
            image: state.image,
            errormessage: failure.errorMessage));
      } else {
        emit(AddResourceSuccess(
            name: state.name,
            category: state.category,
            date: state.date,
            startdate: state.startdate,
            enddate: state.enddate,
            image: state.image));
      }
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(AddResourcefailure(
            name: state.name,
            category: state.category,
            date: state.date,
            startdate: state.startdate,
            enddate: state.enddate,
            image: state.image,
            errormessage: failure.errorMessage));
      }
    }
  }
}
