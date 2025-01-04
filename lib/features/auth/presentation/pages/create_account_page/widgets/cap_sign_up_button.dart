import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/create_account_bloc/create_account_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_btn_bloc/verify_btn_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';

class CapSignUpButton extends StatefulWidget {
  final GlobalKey<FormFieldState> emailValidationKey; 
  final GlobalKey<FormFieldState> passwordValidationeKey; 
  const CapSignUpButton({super.key ,     required this.emailValidationKey,
    required this.passwordValidationeKey,});

  @override
  State<CapSignUpButton> createState() => _DemoState();
}

class _DemoState extends State<CapSignUpButton> {
  late WidgetStatesController widgetStatesController;
  
  @override
  void initState() {    
    super.initState();
    widgetStatesController = WidgetStatesController({WidgetState.disabled});    
  }

  @override
  void dispose() {
    widgetStatesController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Builder(builder: (context) {
            final height = MediaQuery.sizeOf(context).height;
            final emailController = context.read<EmailTextEditingController>();
            final passwordController =
                context.read<PasswordTextEditingController>();
            return BlocListener<VerifyOtpBloc,VerifyOtpState>(
              listener: _verifyOtpBlocListener,
              child: CapBaseWidget(
                child: ElevatedButton(
                    onPressed: () {
                      if(!widgetStatesController.value.contains(WidgetState.disabled)){
                        if ((widget.emailValidationKey.currentState?.validate() ??
                              false) &&
                          (widget.passwordValidationeKey.currentState?.validate() ??
                              false)) {
                        context.read<CreateAccountBloc>().add(
                              CreateAccountEvent(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(
                        Size(0, height * AppConstants.btnSizePercent),
                      ),                      
                    ),
                    statesController: widgetStatesController,
                    child: const Text('Sign up'),                    
                  ),
              ),
            );
          },),);
  }

  void _verifyOtpBlocListener(BuildContext context, VerifyOtpState state) {
    if(state is VerifyOtpSuccessfulState){
            if(widgetStatesController.value.contains(WidgetState.disabled)){
        widgetStatesController.update(WidgetState.disabled, false);
        context.read<VerifyBtnBloc>().add(VerifyBtnInVisibleEvent());
      }         
    }else{
      widgetStatesController.update(WidgetState.disabled, true);
    }
  }
}