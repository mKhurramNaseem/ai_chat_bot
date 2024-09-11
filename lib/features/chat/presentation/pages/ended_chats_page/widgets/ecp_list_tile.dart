import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_base_widgets.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_delete_dialog.dart';

class EcpListTile extends StatelessWidget {
  static const _startSpace = 5,
      _middleSpace = 3,
      _tileTextsFlex = 57,
      _imageFlex = 30;
  static const _padding = 0.01, _heightPercent = 0.15;
  const EcpListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        MediaQuery.paddingOf(context).top;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * _padding),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const EcpDeleteDialog(),
          );
        },
        child: EcpBaseWidget(
          child: Container(
            height: height * _heightPercent,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
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
                  child: EcpEndedChatsTileTexts(),
                ),
                const Spacer(
                  flex: _startSpace,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EcpEndedChatsTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 3, _messageFlex = 50;
  static const _titleFontSize = 0.32, _messageFontSize = 0.22;
  static const _title = 'Bobo-Dec 19, 2024',
      _message = 'Hello Khurram! I\'m Bobo How are you today??';
  static const _maxLines = 2;
  const EcpEndedChatsTileTexts({super.key});

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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.grey,
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
