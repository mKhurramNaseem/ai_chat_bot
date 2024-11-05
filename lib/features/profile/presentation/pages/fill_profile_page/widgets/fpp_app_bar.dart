import 'package:ai_chat_bot/core/core.dart';

class FppAppBar extends AppBar{
  FppAppBar({super.key}):super(title: Builder(
    builder: (context) {
      return Text('Fill Your Profile' , style: Theme.of(context).textTheme.bodyLarge,);
    }
  ),);
}