import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'medican_state.dart'; // ربط ملف الحالة

class MedicanCubit extends Cubit<MedicanState> {
  MedicanCubit() : super(MedicanInitial());
  
   XFile? image ;

  final ImagePicker _picker = ImagePicker();        
  final List<File> images = [];    


  void addimagetolist(){
     images.add(File(image!.path));  
      emit(MedicanImagesUpdated(List.from(images))); 
  }                 

  Future<XFile?> pickImage() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img ;
    }
    return image ;
  }
}
