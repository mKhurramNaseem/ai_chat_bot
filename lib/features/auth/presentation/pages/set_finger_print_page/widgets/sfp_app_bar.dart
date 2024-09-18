import 'package:ai_chat_bot/core/core.dart';

class SfpAppBar extends AppBar{
  SfpAppBar({super.key}):super(
    title: Builder(
      builder: (context) {
        return Text('Set Your Fingerprint' , style: Theme.of(context).textTheme.bodyLarge,);
      }
    )
  );
}