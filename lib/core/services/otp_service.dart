import 'package:ai_chat_bot/core/core.dart';
import 'package:email_otp/email_otp.dart';

abstract class OTPService {
  Future<bool> sendOtp(String email);
  bool verifyOtp(String otp);
}

class OTPServiceImpl extends OTPService {
  @override
  Future<bool> sendOtp(String email) async {    
    EmailOTP.config(      
      appName: AppConstants.botName,
      emailTheme: EmailTheme.v3,
      otpLength: 4,
      otpType: OTPType.numeric,
    );
    var isSend = await EmailOTP.sendOTP(email: email);
    return isSend;
  }


  @override
  bool verifyOtp(String otp) {
    return EmailOTP.verifyOTP(otp: otp);
  }
}
