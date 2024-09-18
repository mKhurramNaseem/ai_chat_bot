import 'package:ai_chat_bot/core/core.dart';

class LipProvidersBaseBtn extends StatelessWidget {
  final String text;
  final Widget icon;
  final void Function() onTap;
  const LipProvidersBaseBtn({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryContainer),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: icon),
            Text(
              '  $text',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class LipFacebookProviderBtn extends StatelessWidget {
  const LipFacebookProviderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return LipProvidersBaseBtn(
      text: 'Continue with Facebook',
      icon: const Icon(
        FontAwesomeIcons.facebook,
        color: Colors.blue,        
      ),
      onTap: () {},
    );
  }
}

class LipGoogleProviderBtn extends StatelessWidget {
  const LipGoogleProviderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return LipProvidersBaseBtn(
        text: 'Continue with Google',
        icon: SvgPicture.asset(
          AppImages.googleSvg,
          height: constraints.maxHeight * 0.35,
        ),
        onTap: () {},
      );
    });
  }
}

class LipAppleProviderBtn extends StatelessWidget {
  const LipAppleProviderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return LipProvidersBaseBtn(
      text: 'Continue with Apple',
      icon: const Icon(FontAwesomeIcons.apple),
      onTap: () {},
    );
  }
}
