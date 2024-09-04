
import '../../../../../../core/core.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: AppIcons.appBarBackIcon,
      ),
      body: CustomScrollView(
        slivers: [
          // Space
          CapTopSpace(),
          // Title Text
          CapTitleText(),
          // Space
          CapTopSpace(),
          // Email Field
          CapEmailField(),
          // Password Field
          CapPasswordField(),
          // Remember Me Box
          CapRememberBox(),
          // Sign Up Button
          CapSignUpButton(),
          // Space
          CapTopSpace(),
          // Continue with text
          CapContinueText(),
          // Space
          CapMiddleSpace(),
          // Auth Providers List
          CapAuthProviders(),
          // Space
          CapMiddleSpace(),
          // Already have account sign in
          CapAlreadyAccountSignIn(),
          // Bottom Space
          CapBottomSpace(),
        ],
      ),
    );
  }
}
