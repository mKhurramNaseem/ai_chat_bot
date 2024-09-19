part of 'edit_image_bloc.dart';

@immutable
sealed class EditImageState {}

final class EditImageInitialState extends EditImageState {}

final class EditImageDoneState extends EditImageState {
  final Uint8List imageBytes;

  EditImageDoneState({required this.imageBytes});

}
