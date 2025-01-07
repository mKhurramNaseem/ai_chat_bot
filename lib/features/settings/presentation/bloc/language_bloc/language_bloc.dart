import 'dart:async';

import 'package:ai_chat_bot/features/settings/domain/usecases/set_language_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SetLanguageUsecase setLanguageUsecase;
  LanguageBloc({required this.setLanguageUsecase,}) : super(LanguageInitialState()) {
    on<UpdateLanguageEvent>(_handleUpdatedLanguageEvent);
  }
  
  FutureOr<void> _handleUpdatedLanguageEvent(UpdateLanguageEvent event, Emitter<LanguageState> emit){
    setLanguageUsecase(event.language);
    emit(LanguageUpdatedState(event.language));
  }

}
