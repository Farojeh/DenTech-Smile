import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:meta/meta.dart';

part 'my_resources_state.dart';

class MyResourcesCubit extends Cubit<MyResourcesState> {
  MyResourcesCubit() : super(MyResourcesInitial()) {
    initial();
  }

  void initial() {
    List<Resource> resources = [
      Resource(
          name: "Dental Materials",
          id: 1,
          image: "assets/images/resorce.png",
          type: "Book and Refrences",
          startdate: "2/2/2023",
          status: true,
          enddate: "2/4/2023"),
      Resource(
          name: "Dental Materials",
          id: 2,
          image: "assets/images/resorce.png",
          type: "Book and Refrences",
          startdate: "2/2/2023",
          enddate: "2/4/2023"),
    ];

    emit(MyResourcesSuccess(resources: resources));
  }

  void updateStatus(Resource resource) {
    if (state is MyResourcesSuccess) {
      final currentState = state as MyResourcesSuccess;
      final updatedResources = currentState.resources.map((res) {
        if (res.id == resource.id) {
          return Resource(
            id: res.id,
            name: res.name,
            image: res.image,
            type: res.type,
            startdate: res.startdate,
            enddate: res.enddate,
            status: false,
          );
        }
        return res;
      }).toList();

      emit(MyResourcesSuccess(resources: updatedResources));
    }
  }
}
