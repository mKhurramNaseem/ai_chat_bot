import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/fp_transition_bloc/fp_transition_bloc.dart';

class FpVerifyButton extends StatelessWidget {
  static const _text = 'Verify';
  const FpVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return FpBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                context.read<FpTransitionBloc>().add(
                    const FpTransitionEvent(widgetType: PageType.sendCodePage));
              },
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(constraints.maxWidth,
                      height * AppConstants.btnSizePercent),
                ),
              ),
              child: const Text(_text),
            ),
          ),
        );
      }),
    );
  }
}