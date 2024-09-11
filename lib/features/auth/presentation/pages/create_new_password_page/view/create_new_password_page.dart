import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_app_bar.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_confirm_password.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_continue_button.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_image.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_password.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_remember_box.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_text.dart';

class CreateNewPasswordPage extends StatefulWidget {
  static const pageName = '/createNewPasswordPage';
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  // Constants
  static const _duration = Duration(milliseconds: 50);
  // Controllers
  late ScrollController scrollController;
  late PasswordTextEditingController passwordTextEditingController;
  late ConfirmPasswordTextEditingController
      confirmPasswordTextEditingController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    passwordTextEditingController = PasswordTextEditingController();
    confirmPasswordTextEditingController =
        ConfirmPasswordTextEditingController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  bool isKeyBoardShown() {
    return MediaQuery.viewInsetsOf(context).bottom.isGreaterThanZero;
  }

  animateToEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: _duration, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    if (isKeyBoardShown()) {
      if (scrollController.hasClients) {
        animateToEnd();
      }
    }
    return MultiProvider(
      providers: [
        ListenableProvider<PasswordTextEditingController>(
          create: (context) => passwordTextEditingController,
        ),
        ListenableProvider<ConfirmPasswordTextEditingController>(
          create: (context) => confirmPasswordTextEditingController,
        ),
        Provider<GlobalKey<FormState>>(
          create: (context) => formKey,
        ),
      ],
      child: Stack(
        children: [
          Scaffold(
            appBar: CnpAppBar(),
            body: Center(
              child: SingleChildScrollView(
                controller: scrollController,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height -
                      kToolbarHeight -
                      MediaQuery.paddingOf(context).top,
                  child: const CreateNewPasswordPageBody(),
                ),
              ),
            ),
          ),
          // const LoadingDialogWidget(),
        ],
      ),
    );
  }
}

class CreateNewPasswordPageBody extends StatelessWidget {
  const CreateNewPasswordPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<GlobalKey<FormState>>(),
      child: const Column(
        children: [
          Expanded(
            flex: 40,
            child: CnpImage(),
          ),
          Expanded(
            flex: 10,
            child: CnpText(),
          ),
          Expanded(
            flex: 10,
            child: CnpPassword(),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 10,
            child: CnpConfirmPassword(),
          ),
          Expanded(
            flex: 10,
            child: CnpRememberBox(),
          ),
          Expanded(
            flex: 16,
            child: CnpContinueButton(),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
