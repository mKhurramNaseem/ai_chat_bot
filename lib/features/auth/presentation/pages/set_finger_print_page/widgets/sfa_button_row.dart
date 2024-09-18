import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/set_finger_print_page/widgets/sfa_base_widget.dart';

class SfaButtonRow extends StatelessWidget {
  static const _continueText = 'Continue', _skipText = 'Skip';
  const SfaButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SfaBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(WelcomePage.pageName, (route) => false,);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.inverseSurface,
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    elevation: const WidgetStatePropertyAll(0.0),
                    fixedSize: WidgetStatePropertyAll(
                      Size(constraints.maxWidth / 2.2,
                          height * AppConstants.btnSizePercent),
                    ),
                  ),
                  child: const Text(_skipText),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(WelcomePage.pageName , (route) => false,);
                  },
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(
                      Size(constraints.maxWidth / 2.2,
                          height * AppConstants.btnSizePercent),
                    ),
                  ),
                  child: const Text(_continueText),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
