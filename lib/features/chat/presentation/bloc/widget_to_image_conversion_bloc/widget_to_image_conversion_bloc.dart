import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:ai_chat_bot/features/chat/domain/usecases/save_image_to_gallery_usecase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/rendering.dart';

part 'widget_to_image_conversion_event.dart';
part 'widget_to_image_conversion_state.dart';

class WidgetToImageConversionBloc
    extends Bloc<WidgetToImageConversionEvent, WidgetToImageConversionState> {
      final SaveImageToGalleryUsecase saveImageToGalleryUsecase;
  File? file;
  WidgetToImageConversionBloc({required this.saveImageToGalleryUsecase}) : super(WidgetToImageConversionInitialState()) {
    on<WidgetToImageConversionEvent>(_handleWidgetToImageConversionEvent);
  }

  FutureOr<void> _handleWidgetToImageConversionEvent(
      WidgetToImageConversionEvent event,
      Emitter<WidgetToImageConversionState> emit) async {                
    var context = event.widgetKey.currentContext;
    if (context != null) {
      RenderRepaintBoundary boundary =
          context.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        if (event.shouldNavigate) {
          var result = await saveImageToGalleryUsecase(pngBytes);
          if(result.isRight()){
            var path = result.getOrElse(() => '',);
            if(path.isNotEmpty){
              emit(WidgetToImageConversionNavigateState(imageFile: File(path)));
            }            
          }         
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
