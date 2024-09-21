part of 'image_edit_bloc.dart';

@immutable
sealed class ImageEditState {}

class ImageEditSimpleState extends ImageEditState {}

class ImageEditDrawingState extends ImageEditState {}

class ImageEditShapeDrawingState extends ImageEditState {}
