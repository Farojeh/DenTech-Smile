import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_resource_state.dart';

class AddResourceCubit extends Cubit<AddResourceState> {
  AddResourceCubit()
      : super(AddResourceInitial(
          name: "",
          category: 1,
          date: 2,
          startdate: "none",
          enddate: "none",
          image: "none",
        ));

  String n = "";

  void setname(String name) {
    emit(state.copyWith(name: name));
  }

  void setcategory(int category) {
    emit(state.copyWith(category: category));
  }

  void setdate(int date) {
    emit(state.copyWith(date: date));
  }

  void setstartdate(String startdate) {
    emit(state.copyWith(startdate: startdate));
  }

  void setenddate(String enddate) {
    emit(state.copyWith(enddate: enddate));
  }

  void setimage(String image) {
    emit(state.copyWith(image: image));
  }

  void save() {
    print(state.name);
    print(state.category);
    print(state.date);
    print(state.startdate);
    print(state.enddate);
    print(state.image);

    if (state.date == 1) {
      if (state.startdate == "none" || state.enddate == "none") {
        throw "you must input start and end date";
      }
    }
    if (state.image == "none") {
      throw "you must select image";
    }
  }
}
