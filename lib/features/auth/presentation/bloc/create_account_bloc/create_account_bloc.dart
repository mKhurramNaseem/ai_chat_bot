// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:ai_chat_bot/core/core.dart';

import 'package:ai_chat_bot/features/auth/domain/usecases/create_account_usecase.dart';
import 'package:ai_chat_bot/shared/domain/usecases/set_email_usecase.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  static const accountNotCreatedMessage = 'Unable to create account';
  static const exceptionMessage = 'Something went wrong';
  final CreateAccountUsecase createAccountUsecase;
  final SetEmailUsecase setEmailUsecase;
  CreateAccountBloc(
    this.createAccountUsecase,
    this.setEmailUsecase,
  ) : super(CreateAccountInitialState()) {
    on<CreateAccountEvent>(_handleCreateAccountEvent);
  }

  FutureOr<void> _handleCreateAccountEvent(
      CreateAccountEvent event, Emitter<CreateAccountState> emit) async {
    emit(CreateAccountLoadingState());
    var result =
        await createAccountUsecase(UserAuthData(event.email, event.password));
    result.fold(
      (l) {
        if (l is UserAlreadyExistsFailure) {
          emit(CreateAccountErrorState('User already exists'));
        } else {
          emit(CreateAccountErrorState('Unable to create account'));
        }
      },
      (r) {
        if (result.getOrElse(
          () => false,
        )) {
          setEmailUsecase(event.email);
          emit(CreateAccountDoneState());
        } else {
          emit(CreateAccountErrorState('Unable to create account'));
        }
      },
    );
  }
}
