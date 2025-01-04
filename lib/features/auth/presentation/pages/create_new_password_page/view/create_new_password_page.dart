import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/create_new_password_bloc/create_new_password_bloc.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_app_bar.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_confirm_password.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_continue_button.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_image.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_password.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/create_new_password_page/widgets/cnp_text.dart';
import 'package:ai_chat_bot/injection_container.dart';

class CreateNewPasswordPage extends StatelessWidget {
  static const pageName = '/createNewPasswordPage';
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CreateNewPasswordBloc>(
        create: (context) => CreateNewPasswordBloc(
          createNewPasswordUsecase: sl(),
          setEmailUsecase: sl(),
        ),
      ),
    ], child: const CreateNewPasswordPageBody());
  }
}

class CreateNewPasswordPageBody extends StatefulWidget {
  const CreateNewPasswordPageBody({super.key});

  @override
  State<CreateNewPasswordPageBody> createState() =>
      _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPageBody> {
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
      child: BlocListener<CreateNewPasswordBloc,CreateNewPasswordState>(
        listener: _createNewPasswordListener,
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
                    child: Form(
                      key: formKey,
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
                            flex: 26,
                            child: CnpContinueButton(),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<CreateNewPasswordBloc, CreateNewPasswordState>(
              builder: (context, state) {
                if (state is CreateNewPasswordLoadingState) {
                  return const LoadingDialogWidget();
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }


  void _createNewPasswordListener(BuildContext context, CreateNewPasswordState state){
    if(state is CreateNewPasswordLoadedState) {
      Navigator.of(context).pushNamedAndRemoveUntil(WelcomePage.pageName,(route) => false, );
    }
  }
}
