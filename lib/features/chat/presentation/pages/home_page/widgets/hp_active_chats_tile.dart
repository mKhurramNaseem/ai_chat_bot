import 'package:ai_chat_bot/core/core.dart';

class HpActiveChatsTile extends StatelessWidget {
  static const _startSpace = 5,
      _middleSpace = 3,
      _tileTextsFlex = 44,
      _imageFlex = 30,
      _iconFlex = 10;
  const HpActiveChatsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return HpBaseWidget(
      child: Container(
        decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            color: Theme.of(context).colorScheme.onPrimaryContainer),
        child: Row(
          children: [
            const Spacer(
              flex: _startSpace,
            ),
            Expanded(
              flex: _imageFlex,
              child: Image.asset(
                AppImages.simpleImage,
              ),
            ),
            const Spacer(
              flex: _middleSpace,
            ),
            const Expanded(
              flex: _tileTextsFlex,
              child: HpActiveChatsTileTexts(),
            ),
            const Spacer(
              flex: _middleSpace,
            ),
            const Expanded(
              flex: _iconFlex,
              child: Icon(
                Icons.chat_rounded,
                color: AppColors.cyan,
              ),
            ),
            const Spacer(
              flex: _startSpace,
            ),
          ],
        ),
      ),
    );
  }
}

class HpActiveChatsTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 3, _messageFlex = 50;
  static const _titleFontSize = 0.32, _messageFontSize = 0.22;
  static const _title = 'Bobo',
      _message = 'Hello Khurram! I\'m Bobo How are you today??';
  static const _maxLines = 2;
  const HpActiveChatsTileTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _titleTextFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  _title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: constraints.maxHeight * _titleFontSize,
                      ),
                ),
              );
            },
          ),
        ),
        const Spacer(
          flex: _spacer,
        ),
        Expanded(
          flex: _messageFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topLeft,
                child: Text(
                  _message,
                  maxLines: _maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: constraints.maxHeight * _messageFontSize,
                      ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
