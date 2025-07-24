import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/archive/model/achive.dart';
import 'package:dentech_smile/student/archive/model/internship.dart';
import 'package:meta/meta.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  LearningCubit() : super(LearningInitial()) {
    initiallearn();
  }
  void initiallearn() {
    List<Archive> archiveList = [
      Archive(
          tag: "assets/images/test3.jpg",
          patient: "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient:  "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient:  "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient:  "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient:  "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient: "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient:  "Front tooth filling",
          internship: "Ahmad monzer",
          rate: 3),
      Archive(
          tag: "assets/images/test3.jpg",
          patient:  "Front tooth filling",
          internship: "Ahmad monzer",
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

    emit(LearningSuccess(
        allinternships: internships, allarchives: selectArchive, select: 0));
  }

  void changeselect(int index) {
    final currentintership = (state as LearningSuccess).allinternships;
    List<Archive> selectArchive = currentintership[index].archives;
    emit(LearningSuccess(
        allarchives: selectArchive,
        select: index,
        allinternships: currentintership));
  }
}
