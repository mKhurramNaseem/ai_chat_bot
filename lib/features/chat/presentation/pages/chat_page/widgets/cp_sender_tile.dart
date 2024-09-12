import 'package:ai_chat_bot/core/core.dart';

class CpSenderTile extends StatelessWidget {
  static const _specificRadius = 6.0;
  final String text;
  const CpSenderTile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Spacer(
            flex: 30,
          ),
          Flexible(
            flex: 70,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(_specificRadius),
                    bottomLeft: Radius.elliptical(17, 20),
                    topLeft: Radius.elliptical(17, 20),
                    topRight: Radius.elliptical(17, 20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Hi!  I am Khurram What are you doing Can We play cricket',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
