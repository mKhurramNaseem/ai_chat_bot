import 'package:ai_chat_bot/core/core.dart';

class CpSenderTile extends StatelessWidget {
  static const _specificRadius = 6.0;
  final ChatMessage message;
  const CpSenderTile({
    super.key,
    required this.message,
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
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(_specificRadius),
                    bottomLeft: message.image != null && message.message.isEmpty
                        ? const Radius.circular(_specificRadius)
                        : const Radius.elliptical(17, 20),
                    topLeft: message.image == null
                        ? const Radius.elliptical(17, 20)
                        : const Radius.circular(_specificRadius),
                    topRight: message.image == null
                        ? const Radius.elliptical(17, 20)
                        : const Radius.circular(_specificRadius),
                  ),
                ),
                child: message.image == null
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          message.message,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.memory(message.image!),
                            if (message.message.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 7.0, left: 7.0, right: 7.0),
                                child: Text(
                                  message.message,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              )
                          ],
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
