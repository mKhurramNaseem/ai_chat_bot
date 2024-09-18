import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_app_bar.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_divider.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_language_tile.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_title_texts.dart';

class LanguagePage extends StatefulWidget {
  static const pageName = '/languagePage';
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? groupValue = languages[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LpAppBar(),
      body: Center(
        child: CustomScrollView(
          slivers: [
            LpSpaceWidget(),
            LpTitleSuggestedText(),
            LpSpaceWidget(),
            for (var i in suggested)
              LpLanguageTile(
                languageName: i,
                originalValue: i,
                groupValue: groupValue,
                onTap: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            LpSmallSpaceWidget(),
            const LpDivider(),
            LpSmallSpaceWidget(),
            LpTitleLanguageText(),
            LpSpaceWidget(),
            for (var i in languages)
              LpLanguageTile(
                languageName: i,
                originalValue: i,
                groupValue: groupValue,
                onTap: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}

List<String> suggested = [
  'English (US)',
  'English (UK)',
];

List<String> languages = [
  'Mandarin',
  'Hindi',
  'Spanish',
  'French',
  'Arabic',
  'Bengali',
  'Urdu',
  'German',
  'Russian',
];
