import 'package:ai_chat_bot/core/core.dart';

class LpAppBar extends AppBar {
  LpAppBar({super.key}):super(title: Builder(
    builder: (context) {
      return Text(AppLocalizations.of(context)?.language ?? 'Language' , style: Theme.of(context).textTheme.bodyLarge,);
    }
  ),);  
}