import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());

  FilePickerResult? pdfResult;
  String pdfName = '';
  double pdfRate = 0;
  int pdfStageId = 0;
  String videoPath = '';
  String videoName = '';
  double videoRate = 0;
  int videoStageId = 0;
  String articleContent = '';
  String articleName = '';
  int articleRate = 0;
  int articleStageId = 0;
  String message = '';
  FilePickerResult? imageResult;
  List<XFile>? images = [];

  Future<void> getPdfFile() async {
    pdfResult = await FilePicker.platform.pickFiles();
    emit(PageSuccess());
  }

  Future<void> postImage() async {
    ImagePicker imagePicker = ImagePicker();
    images = await imagePicker.pickMultiImage();
    emit(PageSuccess());
  }

  bool isNotEmpty() {
    if (pdfName == "") {
      return false;
    } else if (pdfRate == 0) {
      return false;
    } else if (pdfStageId == 0) {
      return false;
    } else if (pdfResult == null || pdfResult!.files.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> storePdf() async {
    // ✅ التحقق من الحقول المطلوبة
    if (pdfName.isEmpty) {
      emit(PageFailure(errorMessage: "Please enter the file name"));
      return;
    }
    if (pdfStageId == 0) {
      emit(PageFailure(errorMessage: "Please select a stage"));
      return;
    }
    if (pdfResult!.xFiles.isEmpty) {
      emit(PageFailure(errorMessage: "Please upload a file"));
      return;
    }

    emit(PageLoading());

    var response = await ApiService.post(
      endPoint: 'api/store-educational-content',
      data: FormData.fromMap({
        'title': pdfName,
        'type': 'pdf',
        'stage_id': pdfStageId,
        'appropriate_rating': pdfRate.toInt(),
        'file': await MultipartFile.fromFile(
          pdfResult!.xFiles[0].path,
          filename: pdfResult!.xFiles[0].name,
        ),
      }),
    );

    if (response['success']) {
      emit(PageSuccess());
      message = 'Done';
    } else {
      message = 'Not Done';
      emit(PageFailure(errorMessage: response['error']));
    }
  }

  Future<void> storeVideo() async {
    emit(PageLoading());

    print(videoName );
    print(videoPath);
    print(userInfo!.getString(Static.token));

    var response = await ApiService.post(
      endPoint: 'api/store-educational-content',
      data: FormData.fromMap({
        'title': videoName,
        'type': 'link',
        'stage_id': videoStageId,
        'appropriate_rating': videoRate.toInt(),
        'content_url': videoPath.toString(),
      }),
    );
     print(response);
    if (response['success']) {
      message = 'Done';
      emit(PageSuccess());
    } else {
      message = 'Not Done';
      emit(PageFailure(errorMessage: response['error']));
    }
  }

  Future<void> storeArticle() async {
    emit(PageLoading());
    List<MultipartFile> imageFiles = await Future.wait(
      images!.map((image) async {
        return await MultipartFile.fromFile(image.path, filename: image.name);
      }),
    );
    print(imageFiles.toString());
    print(articleContent);

    var response = await ApiService.post(
      endPoint: 'api/store-educational-content',
      data: FormData.fromMap({
        'title': articleName,
        'type': 'article',
        'stage_id': articleStageId,
        'appropriate_rating': articleRate.toInt(),
        'text_content': "articleContent",
        'images': await Future.wait(
          images!.map((image) async {
            return await MultipartFile.fromFile(
              image.path,
              filename: image.name,
            );
          }),
        ),
      }),
    );
    print(articleName);
    if (response['success']) {
      emit(PageSuccess());
      message = 'Done';
    } else {
      emit(PageFailure(errorMessage: response['error']));
      message = 'Not Done';
    }
  }
}
