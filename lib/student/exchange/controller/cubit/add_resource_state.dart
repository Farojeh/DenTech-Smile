part of 'add_resource_cubit.dart';

@immutable
 class AddResourceState {
  final String name;
  final int category;
  final int date;
  final String startdate;
  final String enddate;
  final String image;

  AddResourceState(
      {required this.name,
      required this.category,
      required this.date,
      required this.startdate,
      required this.enddate,
      required this.image});

  AddResourceState copyWith(
      {String? name,
      int? category,
      int? date,
      String? startdate,
      String? enddate,
      String? image}) {
    return AddResourceState(
        name: name ?? this.name,
        category: category ?? this.category,
        date: date ?? this.date,
        startdate: startdate ?? this.startdate,
        enddate: enddate ?? this.enddate,
        image: image ?? this.image);
  }
}

final class AddResourceInitial extends AddResourceState {
  AddResourceInitial({required super.name, required super.category, required super.date, required super.startdate, required super.enddate, required super.image});
  
}

final class AddResourceLoading extends AddResourceState {
  AddResourceLoading({required super.name, required super.category, required super.date, required super.startdate, required super.enddate, required super.image});
}

final class AddResourcefailure extends AddResourceState {
  AddResourcefailure({required super.name, required super.category, required super.date, required super.startdate, required super.enddate, required super.image});
}

final class AddResourceSuccess extends AddResourceState {
  AddResourceSuccess({required super.name, required super.category, required super.date, required super.startdate, required super.enddate, required super.image});
}
