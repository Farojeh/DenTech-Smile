import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(QrCodeInitial()){
    initialpage();
  }

  void initialpage(){
    emit(QrCodeSuccess(qrCode: "jjjjjjjlkkkllaaaaaaaaarrrncs';caskf"));
  }
}
