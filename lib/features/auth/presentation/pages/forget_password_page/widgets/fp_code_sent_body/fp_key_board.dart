import 'package:ai_chat_bot/core/core.dart';

class FpKeyBoard extends StatelessWidget {
  const FpKeyBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: const Column(
        children: [
          Expanded(
            child: DigitsRow(
              textOne: '1',
              textTwo: '2',
              textThree: '3',
            ),
          ),
          Expanded(
            child: DigitsRow(
              textOne: '4',
              textTwo: '5',
              textThree: '6',
            ),
          ),
          Expanded(
            child: DigitsRow(
              textOne: '7',
              textTwo: '8',
              textThree: '9',
            ),
          ),
          Expanded(
            child: DigitsRow(
              textOne: '*',
              textTwo: '0',
              textThree: '\u232B',
            ),
          ),
        ],
      ),
    );
  }
}

class DigitsRow extends StatelessWidget {
  final String textOne, textTwo, textThree;
  const DigitsRow({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
  });

  void onBtnTap(BuildContext context, String text) {
    var firstFocusNode = context.read<FirstControllerFocus>();
    var secondFocusNode = context.read<SecondControllerFocus>();
    var thirdFocusNode = context.read<ThirdControllerFocus>();
    var fourthFocusNode = context.read<FourthControllerFocus>();
    if (firstFocusNode.hasFocus) {
      context.read<FirstController>().text = text;
    } else if (secondFocusNode.hasFocus) {
      context.read<SecondController>().text = text;
    } else if (thirdFocusNode.hasFocus) {
      context.read<ThirdController>().text = text;
    } else if (fourthFocusNode.hasFocus) {
      context.read<FourthController>().text = text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var fontStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: constraints.maxHeight * 0.35,
          );
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBtnTap(context, textOne);
              },
              child: ColoredBox(
                color: AppColors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    textOne,
                    style: fontStyle,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBtnTap(context, textTwo);
              },
              child: ColoredBox(
                color: AppColors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    textTwo,
                    style: fontStyle,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (textThree == '\u232B') {
                  onBtnTap(context, '');
                } else {
                  onBtnTap(context, textThree);
                }
              },
              child: ColoredBox(
                color: AppColors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    textThree,
                    style: fontStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
