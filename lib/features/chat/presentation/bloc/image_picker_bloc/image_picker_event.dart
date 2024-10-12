part of 'image_picker_bloc.dart';

@immutable
class ImagePickerEvent {
  final AppImageSource imageSource;

  const ImagePickerEvent({required this.imageSource});
}
