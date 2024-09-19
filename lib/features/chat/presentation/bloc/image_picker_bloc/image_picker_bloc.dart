import 'dart:async';
import 'dart:io';

import 'package:ai_chat_bot/core/core.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitialState()) {
    on<ImagePickerEvent>(_handlePickImageEvent);
  }

  FutureOr<void> _handlePickImageEvent(ImagePickerEvent event, Emitter<ImagePickerState> emit) async{
    var imageXFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(imageXFile != null){
      emit(ImagePickerDoneState(image: File(imageXFile.path)));
    }
  }
}
