import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/archive/model/achive.dart';
import 'package:meta/meta.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial()){
    initialArchive();
  }
  void initialArchive(){
    // List<Archive> archiveList = [
    //   Archive(tag: "#A", patient: "Aleen Morad ", internship: "Tooth extraction InternShip", rate: 3)
    // ];
  }
}
