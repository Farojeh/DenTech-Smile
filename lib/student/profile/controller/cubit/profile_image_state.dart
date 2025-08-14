part of 'profile_image_cubit.dart';

@immutable
sealed class ProfileImageState {}

final class ProfileImageInitial extends ProfileImageState {}
final class ProfileImageloading extends ProfileImageState {}
final class ProfileImagefailure extends ProfileImageState {
  final String errormessage ;

  ProfileImagefailure({required this.errormessage});
}
final class ProfileImagesuccess extends ProfileImageState {}
