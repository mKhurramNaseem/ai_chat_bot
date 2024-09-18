
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/all_activity_page/widgets/aap_base_widget.dart';

class AapDetailTile extends StatelessWidget {
  static const _startSpace = 3,
      _middleSpace = 3,
      _tileTextsFlex = 71,
      _imageFlex = 20;
  const AapDetailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AapBaseWidget(
          child: Container(
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                const Spacer(
                  flex: _startSpace,
                ),
                Expanded(
                  flex: _imageFlex,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Icon(
                      Icons.access_time_filled_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: constraints.maxHeight * 0.6,
                    );
                  }),
                ),
                const Spacer(
                  flex: _middleSpace,
                ),
                const Expanded(
                  flex: _tileTextsFlex,
                  child: AapDetailTileTexts(),
                ),
                const Spacer(
                  flex: _startSpace,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AapDetailTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 6, _messageFlex = 47;
  static const _titleFontSize = 0.4, _messageFontSize = 0.3;
  static const _title = '${AppConstants.botName}-Dec 19, 2024',
      _message = '11:27:35 AM - 13:36:42 PM (2.6 hours)';
  static const _maxLines = 2;
  const AapDetailTileTexts({super.key});

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
