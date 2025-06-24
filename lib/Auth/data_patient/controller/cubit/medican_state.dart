part of 'medican_cubit.dart';
@immutable
sealed class MedicanState {}  


final class MedicanInitial extends MedicanState {}


final class MedicanImagesUpdated extends MedicanState {
  final List<File> images;

  MedicanImagesUpdated(this.images);
}