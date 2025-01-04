import 'package:ai_chat_bot/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final SendOtpUsecase sendOtpUsecase;  
  VerifyEmailBloc({
    required this.sendOtpUsecase,    
  }) : super(VerifyEmailInitialState()) {
    on<SendOtpEvent>((event, emit) async {
      emit(VerifyEmailLoadingState());
      
      // var result = await sendOtpUsecase(event.email);
      // dev.log('OTP Sent' , name: 'verify_email_bloc.dart');
      // if (result.isRight()) {
      //   var isOtpSend = result.getOrElse(
      //     () => false,
      //   );
      //   if (isOtpSend) {
      //     emit(VerifyEmailDoneState(event.email));
      //   } else {
      //     emit(VerifyEmailErrorState('OTP not send'));
      //   }
      // } else {
      //   emit(VerifyEmailErrorState('Unable to send OTP'));
      // }
      await Future.delayed(const Duration(seconds: 2));
      emit(VerifyEmailDoneState(event.email));
    });
  } 
}
