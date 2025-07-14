import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit() : super(DescriptionInitial());

  String desc = "";

   void setdesc({required String n}) {
    desc = n;
  }

  void savedesc(){
    print(desc);
  }
}
