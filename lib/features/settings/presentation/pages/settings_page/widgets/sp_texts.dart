import 'package:ai_chat_bot/core/core.dart';

class SpTitle extends StatelessWidget {
  const SpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.center ,
          child: Text(
            'Andrew Ainsley',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: constraints.maxHeight * 0.3,
                ),
          ),
        );
      },
    );
  }
}

class SpEmailText extends StatelessWidget {
  const SpEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          'andrew_ainsley@yourdomain.com',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: constraints.maxHeight * 0.4,
              ),
        );
      },
    );
  }
}
