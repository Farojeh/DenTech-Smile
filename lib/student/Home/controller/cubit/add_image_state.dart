part of 'add_image_cubit.dart';

@immutable
sealed class AddImageState {}

final class AddImageInitial extends AddImageState {}
final class AddImageLoading extends AddImageState {}
final class AddImagefailure extends AddImageState {
  final String errormessage;

  AddImagefailure({required this.errormessage});
}
final class AddImagesuccess extends AddImageState {}
