import 'package:ai_chat_bot/core/comman_widgets/error_dialog_base_widget.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:ai_chat_bot/injection_container.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const pageName = '/forgotPassword';
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FpTransitionBloc>(
          create: (context) => FpTransitionBloc(),
        ),
        BlocProvider<ForgetPasswordBloc>(
          create: (context) => ForgetPasswordBloc(
            sendOtpUsecase: sl(),
            verifyOtpUsecase: sl(),
          ),
        ),
      ],
      child: const ForgetPasswordPageBody(),
    );
  }
}

class ForgetPasswordPageBody extends StatefulWidget {
  const ForgetPasswordPageBody({super.key});

  @override
  State<ForgetPasswordPageBody> createState() => _ForgetPasswordPageBodyState();
}

class _ForgetPasswordPageBodyState extends State<ForgetPasswordPageBody> {
  late FirstController firstController;
  late SecondController secondController;
  late ThirdController thirdController;
  late FourthController fourthController;

  late FirstControllerFocus firstControllerFocus;
  late SecondControllerFocus secondControllerFocus;
  late ThirdControllerFocus thirdControllerFocus;
  late FourthControllerFocus fourthControllerFocus;

  Widget current = const FpSendCodeBody();

  @override
  void initState() {
    super.initState();
    firstController = FirstController();
    secondController = SecondController();
    thirdController = ThirdController();
    fourthController = FourthController();
    firstControllerFocus = FirstControllerFocus();
    secondControllerFocus = SecondControllerFocus();
    thirdControllerFocus = ThirdControllerFocus();
    fourthControllerFocus = FourthControllerFocus();
    firstControllerFocus.requestFocus();
    firstController.addListener(
      () {
        if (firstController.text.isNotEmpty) {
          secondControllerFocus.requestFocus();
        }
      },
    );
    secondController.addListener(
      () {
        if (secondController.text.isNotEmpty) {
          thirdControllerFocus.requestFocus();
        }
      },
    );
    thirdController.addListener(
      () {
        if (thirdController.text.isNotEmpty) {
          fourthControllerFocus.requestFocus();
        }
      },
    );
    fourthController.addListener(
      () {
        if (fourthController.text.isNotEmpty) {
          fourthControllerFocus.unfocus();
        }
      },
    );
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    firstControllerFocus.dispose();
    secondControllerFocus.dispose();
    thirdControllerFocus.dispose();
    fourthControllerFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<FirstController>(
          create: (context) => firstController,
        ),
        ListenableProvider<SecondController>(
          create: (context) => secondController,
        ),
        ListenableProvider<ThirdController>(
          create: (context) => thirdController,
        ),
        ListenableProvider<FourthController>(
          create: (context) => fourthController,
        ),
        ListenableProvider<FirstControllerFocus>(
          create: (context) => firstControllerFocus,
        ),
        ListenableProvider<SecondControllerFocus>(
          create: (context) => secondControllerFocus,
        ),
        ListenableProvider<ThirdControllerFocus>(
          create: (context) => thirdControllerFocus,
        ),
        ListenableProvider<FourthControllerFocus>(
          create: (context) => fourthControllerFocus,
        ),
      ],
      child: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: _handleForgetPasswordBloc,
        child: Scaffold(
          appBar: FpAppBar(),
          body: Center(
            child: BlocBuilder<FpTransitionBloc, FpTransitionState>(
              builder: (context, state) {
                if (state.current == PageType.sendCodePage) {
                  return const FpSendCodeBody();
                } else {
                  return const FpCodeSentBody();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleForgetPasswordBloc(
      BuildContext context, ForgetPasswordState state) {
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    if (state is ForgetPasswordLoadedState) {
      Navigator.of(context).pushReplacementNamed(CreateNewPasswordPage.pageName,
          arguments: email);
    } else if (state is ForgetPasswordErrorState) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialogBaseWidget(
              image: AppImages.sadImage,
              title:AppLocalizations.of(context)?.error ??  'Error!',
              subtitle: AppLocalizations.of(context)?.invalidOTP ?? 'Invalid OTP');
        },
      );
    }
  }
}
