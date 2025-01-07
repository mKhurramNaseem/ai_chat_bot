import 'dart:async';

import 'package:ai_chat_bot/features/settings/domain/usecases/set_mode_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mode_event.dart';
part 'mode_state.dart';

class ModeBloc extends Bloc<ModeEvent, ModeState> {
  final SetModeUsecase setModeUsecase;
  ModeBloc({required this.setModeUsecase,}) : super(ModeInitialState()) {
    on<UpdateModeEvent>(_handleUpdateModeEvent);    
  }

  FutureOr<void> _handleUpdateModeEvent(UpdateModeEvent event, Emitter<ModeState> emit){
    setModeUsecase(event.mode);  
    emit(ModeUpdateState(event.mode));
  }
}
