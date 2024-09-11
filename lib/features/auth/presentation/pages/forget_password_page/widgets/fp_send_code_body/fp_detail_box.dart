import 'package:ai_chat_bot/core/core.dart';

class FpDetailBox extends StatelessWidget {
  static const _heightPercent = 0.9, _borderRadius = 35.0, _borderWidth = 3.0;
  final String email;
  const FpDetailBox({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return FpBaseWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight * _heightPercent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                _borderRadius,
              ),
              border: Border.all(
                color: AppColors.cyan,
                width: _borderWidth,
              ),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: FpDetailBoxBody(
              maxHeight: constraints.maxHeight,
              email: email,
            ),
          );
        },
      ),
    );
  }
}

class FpDetailBoxBody extends StatelessWidget {
  static const _startSpace = 5, _midSpace = 5, _endSpace = 10;
  static const _circleFlex = 30, _textFlex = 50;
  static const _alpha = 20;
  static const _textBoxHeightPercent = 0.45, _circleHeightPercent = 0.5;
  static const _viaEmailText = 'via Email:';
  final double maxHeight;
  final String email;
  const FpDetailBoxBody({
    super.key,
    required this.maxHeight,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: _startSpace,
        ),
        Expanded(
          flex: _circleFlex,
          child: CircleAvatar(
            backgroundColor: AppColors.cyan.withAlpha(_alpha),
            radius: (maxHeight * _circleHeightPercent) / 2,
            child: const Icon(
              Icons.email_rounded,
              color: AppColors.cyan,
            ),
          ),
        ),
        const Spacer(
          flex: _midSpace,
        ),
        Expanded(
          flex: _textFlex,
          child: SizedBox(
            height: maxHeight * _textBoxHeightPercent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_viaEmailText,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  email.obscureEmail,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        const Spacer(
          flex: _endSpace,
        ),
      ],
    );
  }
}
