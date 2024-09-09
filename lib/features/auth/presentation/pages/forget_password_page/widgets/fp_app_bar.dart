import 'package:ai_chat_bot/core/core.dart';

class FpAppBar extends AppBar {
  static const _title = 'Forgot Password';
  // Padding
  static const _padding = 8.0;
  FpAppBar({super.key})
      : super(
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.all(_padding),
                child: AppIcons.appBarBackIcon,
              ),
            );
          }),
          title: Builder(builder: (context) {
            return Text(
              _title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                  ),
            );
          }),
        );
}
