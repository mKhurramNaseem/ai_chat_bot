import 'package:ai_chat_bot/core/core.dart';

class LpLanguageTile extends SliverToBoxAdapter {
  LpLanguageTile(
      {super.key,
      required String languageName,
      required String originalValue,
      required String? groupValue,
      required void Function(String?) onTap})
      : super(
          child: LapBaseWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    return Text(
                      languageName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    );
                  },
                ),
                Radio<String>(
                  value: originalValue,
                  groupValue: groupValue,
                  onChanged: onTap,                  
                ),
              ],
            ),
          ),
        );
}
