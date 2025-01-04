import 'package:ai_chat_bot/core/comman_widgets/error_dialog_base_widget.dart';
import 'package:ai_chat_bot/core/comman_widgets/simple_loading_widget.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/login_account_bloc/login_account_bloc.dart';
import 'package:ai_chat_bot/injection_container.dart';

import '../../../../../../core/core.dart';

class LoginAccountPage extends StatelessWidget {
  static const pageName = '/loginPage';
  const LoginAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginAccountBloc>(
          create: (context) => LoginAccountBloc(
            loginUsecase: sl(),
            setEmailUsecase: sl(),
          ),
        ),
      ],
      child: const LoginAccountPageBody(),
    );
  }
}

class LoginAccountPageBody extends StatefulWidget {
  const LoginAccountPageBody({super.key});

  @override
  State<LoginAccountPageBody> createState() => _LoginAccountPageState();
}

class _LoginAccountPageState extends State<LoginAccountPageBody> {
  late EmailTextEditingController emailTextEditingController;
  late PasswordTextEditingController passwordTextEditingController;
  final GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    emailTextEditingController = EmailTextEditingController();
    passwordTextEditingController = PasswordTextEditingController();
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return MultiProvider(
      providers: [
        ListenableProvider<EmailTextEditingController>(
          create: (context) => emailTextEditingController,
        ),
        ListenableProvider<PasswordTextEditingController>(
          create: (context) => passwordTextEditingController,
        ),        
      ],
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {}
        },
        child: BlocListener<LoginAccountBloc, LoginAccountState>(
          listener: _loginAccountListener,
          child: Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AppImages.simpleImage),
                  ),
                ),
                body: CustomScrollView(
                  slivers: [
                    // Space
                    LapMaxSpace(),
                    // Title Text
                    LapTitleText(),
                    // Space
                    LapMaxSpace(),
                    // Email Field
                    LapEmailField(emailKey: emailKey,),
                    // Space
                    LapMinSpace(),
                    // Password Field
                    LapPasswordField(passwordKey: passwordKey,),
                    // Remember Me Box
                    // LapRememberBox(),
                    LapMinSpace(),
                    // Sign Up Button
                    LapSignInButton(emailKey: emailKey, passwordKey: passwordKey,),
                    // Space
                    LapMedSpace(),
                    // Forgot Password Text
                    LapForgotPasswordText(emailKey: emailKey,),
                    // Space
                    LapMedSpace(),
                    // Continue with text
                    // LapContinueText(),
                    // Space
                    // LapMedSpace(),
                    // Auth Providers List
                    // LapAuthProviders(),
                    // Space
                    // LapMedSpace(),
                    // Already have account sign in
                    LapNoAccountSignUp(),
                    // Bottom Space
                    LapMinSpace(),
                  ],
                ),
              ),
              BlocBuilder<LoginAccountBloc, LoginAccountState>(
                builder: (context, state) {
                  if (state is LoginAccountLoadingState) {
                    return const SimpleLoadingWidget();
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginAccountListener(BuildContext context, LoginAccountState state) {
    if (state is LoginAccountLoadedState) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        WelcomePage.pageName,
        (route) => false,
      );
    } else if (state is LoginAccountErrorState) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialogBaseWidget(
              image: AppImages.sadImage,
              title: 'Error !',
              subtitle: state.message);
        },
      );
    }
  }
}
