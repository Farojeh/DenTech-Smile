import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/archive/model/achive.dart';
import 'package:dentech_smile/student/archive/model/internship.dart';
import 'package:meta/meta.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial()) {
    initialArchive();
  }
  void initialArchive() {
    List<Archive> archiveList = [
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3),
      Archive(
          tag: "#A",
          patient: "Aleen Morad ",
          internship: "Tooth extraction InternShip",
          rate: 3)
    ];

    List<Internship> internships = [
      Internship(
        id: 'i1',
        name: 'Training A',
        archives: archiveList,
      ),
      Internship(
        id: 'i2',
        name: 'Training B',
        archives: [],
      ),
      Internship(
        id: 'i3',
        name: 'Training C',
        archives: archiveList,
      ),
    ];

    List<Archive> selectArchive = internships[0].archives;

    emit(ArchiveSuccess(
        allinternships: internships, allarchives: selectArchive, select: 0));
  }

  void changeselect(int index) {
    final currentintership = (state as ArchiveSuccess).allinternships;
    List<Archive> selectArchive = currentintership[index].archives;
    emit(ArchiveSuccess(
        allarchives: selectArchive,
        select: index,
        allinternships: currentintership));
  }
}
