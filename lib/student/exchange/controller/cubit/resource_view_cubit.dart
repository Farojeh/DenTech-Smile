import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:meta/meta.dart';

part 'resource_view_state.dart';

class ResourceViewCubit extends Cubit<ResourceViewState> {
  ResourceViewCubit() : super(ResourceViewInitial()) {
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
          enddate: "2/4/2023"),
      Resource(
          name: "Dental Materials",
          id: 1,
          image: "assets/images/resorce.png",
          type: "Book and Refrences",
          startdate: "2/2/2023",
          enddate: "2/4/2023"),
    ];

    emit(ResourceViewSuccess(resources: resources));
  }
}
