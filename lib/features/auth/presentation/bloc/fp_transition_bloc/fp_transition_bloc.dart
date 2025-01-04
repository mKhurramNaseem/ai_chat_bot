import 'dart:async';
import 'package:ai_chat_bot/core/core.dart';
part 'fp_transition_event.dart';
part 'fp_transition_state.dart';

enum PageType {
  sendCodePage,
  codeSentPage,
}

class FpTransitionBloc extends Bloc<FpTransitionEvent, FpTransitionState> {  
  FpTransitionBloc()
      : super(const FpTransitionInitialState(current: PageType.sendCodePage)) {
    on<FpTransitionEvent>(_handleTransitionEvent);
  }

  FutureOr<void> _handleTransitionEvent(
      FpTransitionEvent event, Emitter<FpTransitionState> emit) {
    emit(FpTransitionInitialState(current: event.widgetType));
  }
}
