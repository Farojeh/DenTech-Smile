part of 'illness_cubit_cubit.dart';

@immutable
 class IllnessCubitState {
   final List<Illness> illnesses;

  const IllnessCubitState({required this.illnesses});

  IllnessCubitState copyWith({List<Illness>? illnesses}) {
    return IllnessCubitState(
      illnesses: illnesses ?? this.illnesses,
    );
  }
 }
