import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_resource_dialog_state.dart';

class MyResourceDialogCubit extends Cubit<MyResourceDialogState> {
  MyResourceDialogCubit() : super(MyResourceDialogInitial());
  
  void changestatus(){
    emit(MyResourceDialogSuccess());
  }

}
