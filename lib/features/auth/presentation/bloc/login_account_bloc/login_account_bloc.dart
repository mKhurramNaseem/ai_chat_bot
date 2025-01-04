import 'dart:async';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_chat_bot/shared/domain/usecases/set_email_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_account_event.dart';
part 'login_account_state.dart';

class LoginAccountBloc extends Bloc<LoginAccountEvent, LoginAccountState> {
  final LoginUsecase loginUsecase;
  final SetEmailUsecase setEmailUsecase;
  LoginAccountBloc({required this.loginUsecase, required this.setEmailUsecase,}) : super(LoginAccountInitialState()) {
    on<LoginAccountEvent>(_handleLoginAccountEvent);
  }

  FutureOr<void> _handleLoginAccountEvent(LoginAccountEvent event, Emitter<LoginAccountState> emit) async{   
    emit(LoginAccountLoadingState());
      var result = await loginUsecase(UserAuthData(event.email, event.password));    
      result.fold((l) {
        if(l is UserNotFoundFailure){
          emit(LoginAccountErrorState(message: 'Email not found'));
        }else if(l is InvalidPasswordFailure){
          emit(LoginAccountErrorState(message: 'Password Incorrect'));
        }else{
          emit(LoginAccountErrorState(message: 'Something went wrong'));
        }
      }, (r) {
        if(r){
          setEmailUsecase(event.email);
          emit(LoginAccountLoadedState());
        }else{
          emit(LoginAccountErrorState(message: ''));
        }
      },);
  }

}
