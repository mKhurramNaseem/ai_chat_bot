part of 'widget_to_image_conversion_bloc.dart';

class WidgetToImageConversionEvent{
  final GlobalKey widgetKey;
  final bool shouldNavigate;
  WidgetToImageConversionEvent({required this.widgetKey , this.shouldNavigate = false});
}
