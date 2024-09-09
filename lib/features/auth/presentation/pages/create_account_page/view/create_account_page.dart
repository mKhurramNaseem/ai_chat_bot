import '../../../../../../core/core.dart';

class CreateAccountPage extends StatefulWidget {
  static const pageName = '/createAccountPage';
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late EmailTextEditingController emailTextEditingController;
  late PasswordTextEditingController passwordTextEditingController;
  final GlobalKey<FormState> formKey = GlobalKey();

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
        Provider<GlobalKey<FormState>>(
          create: (context) => formKey,
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: AppIcons.appBarBackIcon,
        ),
        body: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              // Space
              CapMaxSpace(),
              // Title Text
              CapTitleText(),
              // Space
              CapMaxSpace(),
              // Email Field
              CapEmailField(),
              // Space
              CapMinSpace(),
              // Password Field
              CapPasswordField(),
              // Remember Me Box
              CapRememberBox(),
              // Sign Up Button
              CapSignUpButton(),
              // Space
              CapMedSpace(),
              // Continue with text
              CapContinueText(),
              // Space
              CapMedSpace(),
              // Auth Providers List
              CapAuthProviders(),
              // Space
              CapMedSpace(),
              // Already have account sign in
              CapAlreadyAccountSignIn(),
              // Bottom Space
              CapMinSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
