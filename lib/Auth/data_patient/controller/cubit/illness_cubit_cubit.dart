import 'package:bloc/bloc.dart';
import 'package:dentech_smile/Auth/data_patient/model/illness.dart';
import 'package:meta/meta.dart';

part 'illness_cubit_state.dart';

class IllnessCubitCubit extends Cubit<IllnessCubitState> {
  IllnessCubitCubit()
      : super(IllnessCubitState(illnesses: [
          Illness(
              enname: "Diabetes", arname: "داء السكري", active: false, id: 1),
          Illness(
              enname: "Heart disease",
              arname: "امراض القلب",
              active: false,
              id: 2),
          Illness(enname: "Smoking", arname: "تدخين", active: false, id: 3),
          Illness(enname: "Pregnant", arname: "حمل", active: false, id: 4),
          Illness(
              enname: "Endocrine diseases",
              arname: "امراض الغدد الصم",
              id: 5,
              active: false),
          Illness(
              enname: "Drug allergy",
              arname: "حساسية دوائية ",
              id: 6,
              active: false),
          Illness(
              enname: "Infectious diseases",
              arname: "امراض معدية ",
              id: 7,
              active: false),
        ]));

  List<Illness> activeillnesses = [];

  void toggleIllness(int index) {
    final updatedList = [...state.illnesses];
    final updatedIllness = updatedList[index].copyWith(
      active: !updatedList[index].active,
    );
    updatedList[index] = updatedIllness;

    emit(state.copyWith(illnesses: updatedList));

    activeillnesses = updatedList
        .where((illness) => illness.active)
        .map((illness) => illness)
        .toList();
  }
}
