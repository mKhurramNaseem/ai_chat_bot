import 'package:ai_chat_bot/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final VerifyOtpUsecase verifyOtpUsecase;
  VerifyOtpBloc({required this.verifyOtpUsecase}) : super(VerifyOtpFailedState()) {
    on<VerifyOtpEvent>((event, emit) {
      if(event.otp.isEmpty){
        emit(VerifyOtpFailedState());
      }else{
        emit(VerifyOtpSuccessfulState());
      }      
      // var result = verifyOtpUsecase(event.otp);      
      // if(result.isRight()){
      //   if(result.getOrElse(() => false,)){
      //     emit(VerifyOtpSuccessfulState());
      //   }else{
      //     emit(VerifyOtpFailedState());
      //   }
      // }else{
      //   emit(VerifyOtpFailedState());
      // }

    });
  }
}
