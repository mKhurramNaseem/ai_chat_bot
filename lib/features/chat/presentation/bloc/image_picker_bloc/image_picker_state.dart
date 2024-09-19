part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitialState extends ImagePickerState {}

class ImagePickerDoneState extends ImagePickerState{
  final File image;

  ImagePickerDoneState({required this.image});  
}
