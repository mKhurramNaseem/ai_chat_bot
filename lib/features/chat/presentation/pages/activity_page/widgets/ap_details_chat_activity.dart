import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/activity_page/widgets/ap_base_widget.dart';

class ApDetailsChatActivity extends StatelessWidget {
  static const _text = 'Details Chat Activity', _seeAll = 'See All';
  static const _fontSizePercent = 0.3, _secondaryFontSize = 0.25;
  const ApDetailsChatActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ApBaseWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: constraints.maxHeight * _fontSizePercent,
                    ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  _seeAll,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.cyan,
                        fontSize: constraints.maxHeight * _secondaryFontSize,
                      ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
