import 'package:bloc/bloc.dart';
import 'package:dentech_smile/Auth/data_patient/model/illness.dart';
import 'package:meta/meta.dart';

part 'illness_cubit_state.dart';

class IllnessCubitCubit extends Cubit<IllnessCubitState> {
  IllnessCubitCubit()
      : super(IllnessCubitState(illnesses: [
          Illness(enname: "Diabetes", arname: "داء السكري", active: false),
          Illness(
              enname: "Heart disease", arname: "امراض القلب", active: false),
          Illness(enname: "Smoking", arname: "تدخين", active: false),
          Illness(enname: "Pregnant", arname: "حمل", active: false),
          Illness(
              enname: "Endocrine diseases",
              arname: "امراض الغدد الصم",
              active: false),
          Illness(
              enname: "Drug allergy",
              arname: "حساسية دوائية ",
              active: false),
          Illness(
              enname: "Infectious diseases",
              arname: "امراض معدية ",
              active: false),
        ]));

  void toggleIllness(int index) {
    final updatedList = [...state.illnesses];
    final updatedIllness = updatedList[index].copyWith(
      active: !updatedList[index].active,
    );
    updatedList[index] = updatedIllness;

    emit(state.copyWith(illnesses: updatedList));
    final selectedNames = updatedList
      .where((illness) => illness.active)
      .map((illness) => illness.enname)
      .toList();

  print("الأمراض المختارة: $selectedNames");
  }
}
