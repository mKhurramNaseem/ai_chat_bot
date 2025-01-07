import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/domain/usecases/get_language_usecase.dart';
import 'package:ai_chat_bot/features/settings/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_app_bar.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_divider.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_language_tile.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/language_page/widgets/lp_title_texts.dart';
import 'package:ai_chat_bot/injection_container.dart';

class LanguagePage extends StatefulWidget {
  static const pageName = '/languagePage';
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? groupValue = suggested[0].$2;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LanguageBloc>();
    var getLanguageUseCase = sl<GetLanguageUsecase>();
    groupValue = getLanguageUseCase();
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
                languageName: i.$1,
                originalValue: i.$2,
                groupValue: groupValue,
                onTap: (value) {
                  setState(() {
                    groupValue = value;
                    bloc.add(UpdateLanguageEvent(value!));
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
                languageName: i.$1,
                originalValue: i.$2,
                groupValue: groupValue,
                onTap: (value) {
                  setState(() {
                    groupValue = value;
                    bloc.add(UpdateLanguageEvent(value!));
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}

List<(String,String)> suggested = [
  ('English (US)' , 'en'),  
];

List<(String , String)> languages = [
  ('Mandarin' , 'zh'),
  ('Hindi' , 'hi'),
  ('Spanish' , 'es'),
  ('French' , 'fr'),
  ('Arabic' , 'ar'),
  ('Bengali' , 'bn'),
  ('Urdu' , 'ur'),
  ('German' , 'de'),
  ('Russian' , 'ru'),
];
