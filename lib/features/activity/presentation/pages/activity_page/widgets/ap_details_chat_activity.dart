import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:ai_chat_bot/features/activity/presentation/pages/all_activity_page/view/all_activity_page.dart';

class ApDetailsChatActivity extends StatelessWidget {
  static const _text = 'Details Chat Activity', _seeAll = 'See All';
  static const _fontSizePercent = 0.3, _secondaryFontSize = 0.25;  
  final List<Activity> activites;
  const ApDetailsChatActivity({super.key , required this.activites,});

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
                onTap: () {
                  Navigator.of(context).pushNamed(AllActivityPage.pageName , arguments: activites);
                },
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
