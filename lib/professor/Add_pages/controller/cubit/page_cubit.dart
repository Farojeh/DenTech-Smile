import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/utils/api.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());

  FilePickerResult? pdfResult;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
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

  Future<bool> storePdf() async {
    // ✅ التحقق من الحقول المطلوبة
    if (pdfName.isEmpty) {
      emit(PageFailure(errorMessage: "Please enter the file name"));
      return false ;
    }
    if (pdfStageId == 0) {
      emit(PageFailure(errorMessage: "Please select a stage"));
      return false;
    }
    if (pdfResult!.xFiles.isEmpty) {
      emit(PageFailure(errorMessage: "Please upload a file"));
      return false;
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
      return true;
    } else {
      message = 'Not Done';
      emit(PageFailure(errorMessage: response['error']));
      return false;
    }
  }

  Future<bool> storeVideo() async {
    emit(PageLoading());

    var response = await ApiService.post(
      endPoint: 'api/store-educational-content',
      data: FormData.fromMap({
        'title': videoName,
        'type': 'link',
        'stage_id': videoStageId.toString(),
        'appropriate_rating': videoRate.toInt().toString(),
        'content_url': videoPath.toString(),
      }),
    );
    if (response['success']) {
      message = 'Done';
      emit(PageSuccess());
      return true ;
    } else {
      message = 'Not Done';
      emit(PageFailure(errorMessage: response['error']));
       return false ;
    }
  }

  Future<bool> storeArticle() async {
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
        'text_content': articleContent,
        'images[]': await Future.wait(
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
      return true;
    } else {
      emit(PageFailure(errorMessage: response['error']));
      message = 'Not Done';
      return false;
    }
  }
}
