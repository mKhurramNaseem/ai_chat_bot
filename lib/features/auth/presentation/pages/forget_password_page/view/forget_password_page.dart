import 'package:ai_chat_bot/core/controllers/otp_controllers.dart';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/fp_transition_bloc/fp_transition_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/forget_password_page/widgets/fp_send_code_body/fp_send_code_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const pageName = '/forgotPassword';
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FpTransitionBloc>(
      create: (context) => FpTransitionBloc(),
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
          }),
        ),
      ),
    );
  }
}
