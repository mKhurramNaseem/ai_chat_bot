import 'dart:async';

import 'package:ai_chat_bot/core/util/app_enums.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_edit_event.dart';
part 'image_edit_state.dart';

class ImageEditBloc extends Bloc<ImageEditEvent, ImageEditState> {
  ImageEditBloc() : super(ImageEditSimpleState()) {
    on<ImageEditEvent>(_handleImageEditEvent);
  }

  FutureOr<void> _handleImageEditEvent(ImageEditEvent event, Emitter<ImageEditState> emit) {
    if(event.pageType == ImageEditPageType.simpleType){
      emit(ImageEditSimpleState());
    }else if(event.pageType == ImageEditPageType.drawingType){
      emit(ImageEditDrawingState());
    }else{
      emit(ImageEditShapeDrawingState());
    }
  }
}
