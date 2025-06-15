part of 'translation_cubit.dart';

@immutable
class TranslationState {
  final bool isEn ;

 const TranslationState({this.isEn = true});

 TranslationState copyWith({bool? isEn}) {
    return TranslationState(
      isEn: isEn ?? this.isEn,
    );
  }


}

