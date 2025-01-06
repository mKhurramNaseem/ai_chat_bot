import 'package:ai_chat_bot/core/core.dart';

class EppAppBar extends AppBar{
  static const _title = 'Edit Profile';
  EppAppBar({super.key}):super(
    title: Builder(
      builder: (context) {
        return Text(AppLocalizations.of(context)?.editProfile ?? _title , style: Theme.of(context).textTheme.bodyLarge,);
      },
    ),
    
  );
}