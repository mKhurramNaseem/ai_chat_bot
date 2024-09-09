import '../../../../../../core/core.dart';


class LoginAccountPage extends StatefulWidget {
  static const pageName = '/loginPage';
  const LoginAccountPage({super.key});

  @override
  State<LoginAccountPage> createState() => _LoginAccountPageState();
}

class _LoginAccountPageState extends State<LoginAccountPage> {
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
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if(!didPop){
            
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                  padding: EdgeInsets.all(AppConstants.iconPadding),
                  child: AppIcons.appBarBackIcon),
            ),
          ),
          body: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                // Space
                LapMaxSpace(),
                // Title Text
                LapTitleText(),
                // Space
                LapMaxSpace(),
                // Email Field
                LapEmailField(),
                // Space
                LapMinSpace(),
                // Password Field
                LapPasswordField(),
                // Remember Me Box
                LapRememberBox(),
                // Sign Up Button
                LapSignInButton(),
                // Space
                LapMedSpace(),
                // Forgot Password Text
                LapForgotPasswordText(),
                // Space
                LapMedSpace(),
                // Continue with text
                LapContinueText(),
                // Space
                LapMedSpace(),
                // Auth Providers List
                LapAuthProviders(),
                // Space
                LapMedSpace(),
                // Already have account sign in
                LapNoAccountSignUp(),
                // Bottom Space
                LapMinSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
