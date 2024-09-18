import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter/scheduler.dart';

class CreateNewPinPage extends StatefulWidget {
  static const pageName = '/createNewPage';

  const CreateNewPinPage({super.key});

  @override
  State<CreateNewPinPage> createState() => _CreateNewPinPageState();
}

class _CreateNewPinPageState extends State<CreateNewPinPage> {
  static const topSpace = 10;
  static const textFlex = 7, inputFieldsFlex = 20;
  static const btnFlex = 25, belowSpace = 3, keyboardFlex = 35;
  late FirstController firstController;
  late SecondController secondController;
  late ThirdController thirdController;
  late FourthController fourthController;

  late FirstControllerFocus firstControllerFocus;
  late SecondControllerFocus secondControllerFocus;
  late ThirdControllerFocus thirdControllerFocus;
  late FourthControllerFocus fourthControllerFocus;

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
    // firstControllerFocus.requestFocus();
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
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        firstControllerFocus.requestFocus();
      },
    );
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
        appBar: CnppAppBar(),
        body: const Center(
          child: Column(
            children: [
              Spacer(
                flex: topSpace,
              ),
              Expanded(
                flex: textFlex,
                child: CnppEmailText(),
              ),
              Expanded(
                flex: inputFieldsFlex,
                child: CnppInputFields(),
              ),
              Expanded(
                flex: btnFlex,
                child: CnppContinueBtn(),
              ),
              Spacer(
                flex: belowSpace,
              ),
              Expanded(
                flex: keyboardFlex,
                child: CnppKeyboard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
