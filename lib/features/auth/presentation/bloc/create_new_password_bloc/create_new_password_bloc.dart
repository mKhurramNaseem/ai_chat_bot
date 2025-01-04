import 'dart:async';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/domain/usecases/create_new_password_usecase.dart';
import 'package:ai_chat_bot/shared/domain/usecases/set_email_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_new_password_event.dart';
part 'create_new_password_state.dart';

class CreateNewPasswordBloc
    extends Bloc<CreateNewPasswordEvent, CreateNewPasswordState> {
      final CreateNewPasswordUsecase createNewPasswordUsecase;
      final SetEmailUsecase setEmailUsecase;
  CreateNewPasswordBloc({required this.createNewPasswordUsecase, required this.setEmailUsecase,}) : super(CreateNewPasswordInitialState()) {
    on<CreateNewPasswordEvent>(_handleCreateNewPassword);
  }

  FutureOr<void> _handleCreateNewPassword(
      CreateNewPasswordEvent event, Emitter<CreateNewPasswordState> emit) async{
        emit(CreateNewPasswordLoadingState());
        var result = await createNewPasswordUsecase(UserAuthData(event.email, event.password));       
        result.fold((l) {
          emit(CreateNewPasswordErrorState());
        }, (r) {
          setEmailUsecase(event.email);
          emit(CreateNewPasswordLoadedState());
        },);
      }
}
