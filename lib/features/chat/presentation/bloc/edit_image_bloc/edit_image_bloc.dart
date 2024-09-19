import 'dart:async';
import 'dart:ui' as ui;
import 'package:ai_chat_bot/core/core.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

part 'edit_image_event.dart';
part 'edit_image_state.dart';

class EditImageBloc extends Bloc<EditImageEvent, EditImageState> {
  EditImageBloc() : super(EditImageInitialState()) {
    on<WidgetToImageConversionEvent>(_handleWidgetToImageConversionEvent);
  }

  FutureOr<void> _handleWidgetToImageConversionEvent(
      WidgetToImageConversionEvent event, Emitter<EditImageState> emit) async {
    RenderRepaintBoundary boundary = event.widgetKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    emit(EditImageDoneState(imageBytes: pngBytes));
  }
}
