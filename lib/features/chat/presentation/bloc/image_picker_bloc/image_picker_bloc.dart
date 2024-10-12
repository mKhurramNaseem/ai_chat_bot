import 'dart:async';
import 'dart:io';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/pick_image_usecase.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final PickImageUsecase pickImageUsecase;
  ImagePickerBloc({required this.pickImageUsecase,}) : super(ImagePickerInitialState()) {
    on<ImagePickerEvent>(_handlePickImageEvent);
  }

  FutureOr<void> _handlePickImageEvent(ImagePickerEvent event, Emitter<ImagePickerState> emit) async{            
    var result = await pickImageUsecase(event.imageSource);
    if(result.isRight()){
      emit(ImagePickerDoneState(image: result.getOrElse(() => File(''),)));   
    }          
  }
}
