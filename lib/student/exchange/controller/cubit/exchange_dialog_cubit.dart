import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:meta/meta.dart';

part 'exchange_dialog_state.dart';

class ExchangeDialogCubit extends Cubit<ExchangeDialogState> {
  ExchangeDialogCubit() : super(ExchangeDialogInitial()){
     initial();
  }

  void initial(){
    emit(ExchangeDialogSuccess(resource: Resource(
          name: "Dental Materials",
          id: 1,
          image: "assets/images/resorce.png",
          type: "Book and Refrences",
          startdate: "2/2/2023",
          enddate: "2/4/2023"), number: "937281629",name: "Dania Mahfouz"));
  }
}
