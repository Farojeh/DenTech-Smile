import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'medican_state.dart'; // ربط ملف الحالة

class MedicanCubit extends Cubit<MedicanState> {
  MedicanCubit() : super(MedicanInitial());

  final ImagePicker _picker = ImagePicker();        
  final List<File> _images = [];                     

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _images.add(File(image.path));  
      emit(MedicanImagesUpdated(List.from(_images))); 
    }
  }
}
