import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/rendering.dart';

part 'widget_to_image_conversion_event.dart';
part 'widget_to_image_conversion_state.dart';

class WidgetToImageConversionBloc
    extends Bloc<WidgetToImageConversionEvent, WidgetToImageConversionState> {
  File? file;
  WidgetToImageConversionBloc() : super(WidgetToImageConversionInitialState()) {
    on<WidgetToImageConversionEvent>(_handleWidgetToImageConversionEvent);
  }

  FutureOr<void> _handleWidgetToImageConversionEvent(
      WidgetToImageConversionEvent event,
      Emitter<WidgetToImageConversionState> emit) async {
    var context = event.widgetKey.currentContext;
    if (context != null) {
      RenderRepaintBoundary boundary =
          context.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        if (event.shouldNavigate) {
          emit(WidgetToImageConversionNavigateState(imageBytes: pngBytes));
        } else {          
          var directory = await getTemporaryDirectory();
          file = File('${directory.path}/${pngBytes.hashCode}.png');
          if (file != null) {            
            file = await file!.create();
            file!.writeAsBytesSync(pngBytes);
            log(file.hashCode.toString());
            emit(WidgetToImageConversionDoneState(imageFile: file!));
          }
        }
      }
    }
  }
}
