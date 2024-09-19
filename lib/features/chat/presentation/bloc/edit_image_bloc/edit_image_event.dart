part of 'edit_image_bloc.dart';

@immutable
sealed class EditImageEvent {}


class WidgetToImageConversionEvent extends EditImageEvent{
  final GlobalKey widgetKey;

  WidgetToImageConversionEvent({required this.widgetKey});
}
