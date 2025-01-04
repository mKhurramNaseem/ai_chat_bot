import 'dart:async';

import 'package:ai_chat_bot/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:ai_chat_bot/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  ForgetPasswordBloc({
    required this.sendOtpUsecase,
    required this.verifyOtpUsecase,
  }) : super(ForgetPasswordInitialState()) {
    on<SendOtpEvent>(_handleSendOtpEvent);
    on<VerifyOtpEvent>(_handleVerifyOtpEvent);
  }

  FutureOr<void> _handleSendOtpEvent(
      SendOtpEvent event, Emitter<ForgetPasswordState> emit) async {
    var result = await sendOtpUsecase(event.email);
    result.fold(
      (l) {},
      (r) {},
    );
  }

  FutureOr<void> _handleVerifyOtpEvent(
      VerifyOtpEvent event, Emitter<ForgetPasswordState> emit) async {
    var result = verifyOtpUsecase(event.otp);
    result.fold((l) {
      emit(ForgetPasswordErrorState());
    }, (r) {
      if(r){
        emit(ForgetPasswordLoadedState());
      }     else{
        emit(ForgetPasswordErrorState());
      }
    },);
  }
}
