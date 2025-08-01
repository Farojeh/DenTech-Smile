import 'package:bloc/bloc.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:meta/meta.dart';

part 'my_exchanges_state.dart';

class MyExchangesCubit extends Cubit<MyExchangesState> {
  MyExchangesCubit() : super(MyExchangesInitial()){
     initial();
  }

  void initial(){
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

    emit(MyExchangesSuccess(resources: resources));
  }
}
