import 'package:ai_chat_bot/core/comman_widgets/error_dialog_base_widget.dart';
import 'package:ai_chat_bot/core/comman_widgets/simple_loading_widget.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/create_account_bloc/create_account_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_btn_bloc/verify_btn_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_pin_page/view/create_new_pin_page.dart';
import 'package:ai_chat_bot/features/profile/presentation/pages/fill_profile_page/view/fill_profile_page.dart';
import 'package:ai_chat_bot/injection_container.dart';
import '../../../../../../core/core.dart';

class CreateAccountPage extends StatelessWidget {
  static const pageName = '/createAccountPage';
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VerifyEmailBloc>(
          create: (context) => VerifyEmailBloc(
            sendOtpUsecase: sl(),
          ),
        ),
        BlocProvider<CreateAccountBloc>(
          create: (context) => CreateAccountBloc(
            sl(),
            sl(),
          ),
        ),
        BlocProvider<VerifyBtnBloc>(
          create: (context) => VerifyBtnBloc(),
        ),
      ],
      child: const CreateAccountPageBody(),
    );
  }
}

class CreateAccountPageBody extends StatefulWidget {
  const CreateAccountPageBody({super.key});

  @override
  State<CreateAccountPageBody> createState() => _CreateAccountPageBodyState();
}

class _CreateAccountPageBodyState extends State<CreateAccountPageBody> {
  late EmailTextEditingController emailTextEditingController;
  late PasswordTextEditingController passwordTextEditingController;
  final GlobalKey<FormFieldState> emailValidationKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordValidationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    emailTextEditingController = EmailTextEditingController();
    emailTextEditingController.addListener(_emailControllerListener);
    passwordTextEditingController = PasswordTextEditingController();
    context.read<VerifyOtpBloc>().add(const VerifyOtpEvent(otp: ''));
  }

  void _emailControllerListener() {
    if (context.read<VerifyOtpBloc>().state is VerifyOtpFailedState) {
      if (emailTextEditingController.text.isEmpty) {
        context.read<VerifyBtnBloc>().add(VerifyBtnInVisibleEvent());
      } else {
        context.read<VerifyBtnBloc>().add(VerifyBtnVisibleEvent());
      }
    }
  }

  @override
  void dispose() {
    emailTextEditingController
      ..removeListener(_emailControllerListener)
      ..dispose();
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
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreateAccountBloc, CreateAccountState>(
            listener: _createAccountBlocListener,
          ),
          BlocListener<VerifyEmailBloc, VerifyEmailState>(
            listener: _verifyEmailBlocListener,
          ),
        ],
        child: BlocListener<CreateAccountBloc, CreateAccountState>(
          listener: _createAccountBlocListener,
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
                    CapMaxSpace(),
                    // Title Text
                    CapTitleText(),
                    // Space
                    CapMaxSpace(),
                    // Email Field
                    CapEmailField(
                      emailValidationKey: emailValidationKey,
                    ),
                    // Verify Email Button
                    BlocBuilder<VerifyBtnBloc, VerifyBtnState>(
                        builder: (context, state) {
                      if (state is VerifyBtnVisibleState) {
                        return CapVerifyEmailButton(
                          emailValidationKey: emailValidationKey,
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(),
                        ),
                      );
                    }),
                    // Password Field
                    CapPasswordField(
                      passwordValidationKey: passwordValidationKey,
                    ),
                    // Space
                    CapMinSpace(),
                    // Sign Up Button
                    CapSignUpButton(
                      emailValidationKey: emailValidationKey,
                      passwordValidationeKey: passwordValidationKey,
                    ),
                    // Space
                    // CapMedSpace(),
                    // Continue with text
                    // CapContinueText(),
                    // Space
                    // CapMedSpace(),
                    // Auth Providers List
                    // CapAuthProviders(),
                    // Space
                    CapMedSpace(),
                    // Already have account sign in
                    CapAlreadyAccountSignIn(),
                    // Bottom Space
                    CapMinSpace(),
                  ],
                ),
              ),
              BlocBuilder<VerifyEmailBloc, VerifyEmailState>(
                builder: (context, state) {
                  if (state is VerifyEmailLoadingState) {
                    return const SimpleLoadingWidget();
                  }
                  return const SizedBox();
                },
              ),
              BlocBuilder<CreateAccountBloc, CreateAccountState>(
                builder: (context, state) {
                  if (state is CreateAccountLoadingState) {
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

  void _createAccountBlocListener(
      BuildContext context, CreateAccountState state) {
    if (state is CreateAccountDoneState) {
      Navigator.of(context).pushReplacementNamed(FillProfilePage.pageName);
    } else if (state is CreateAccountErrorState) {
      context.read<VerifyOtpBloc>().add(const VerifyOtpEvent(otp: ''));
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialogBaseWidget(
              image: AppImages.sadImage,
              title: 'Error!',
              subtitle: state.message);
        },
      );
    }
  }

  void _verifyEmailBlocListener(BuildContext context, VerifyEmailState state) {
    if (state is VerifyEmailDoneState) {
      Navigator.of(context)
          .pushNamed(OTPVerificationPage.pageName, arguments: state.email);
    } else if (state is VerifyEmailErrorState) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialogBaseWidget(
              image: AppImages.sadImage,
              title: 'Error !',
              subtitle: state.errorMessage);
        },
      );
    }
  }
}
