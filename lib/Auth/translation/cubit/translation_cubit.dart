import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(const TranslationState());

  void translate(){
    emit(state.copyWith(isEn: !state.isEn));
  }


}
