part of 'widget_to_image_conversion_bloc.dart';

@immutable
sealed class WidgetToImageConversionState {}

final class WidgetToImageConversionInitialState
    extends WidgetToImageConversionState {}

final class WidgetToImageConversionDoneState
    extends WidgetToImageConversionState {
  final File imageFile;

  WidgetToImageConversionDoneState({required this.imageFile});
}

final class WidgetToImageConversionNavigateState
    extends WidgetToImageConversionState {
  final File imageFile;

  WidgetToImageConversionNavigateState({required this.imageFile});
}
