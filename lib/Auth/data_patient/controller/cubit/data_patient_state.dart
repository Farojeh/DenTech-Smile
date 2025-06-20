part of 'data_patient_cubit.dart';

@immutable
class DataPatientState {
  final int selectPage;
  final List pageArray = [
   const IlnessPage(),
   const MedicanPage(),
   const InformationPage()
  ];

   DataPatientState({this.selectPage = 0});

  DataPatientState copyWith({int? selectPage}) {
    return DataPatientState(
      selectPage: selectPage ?? this.selectPage,
    );
  }
}

