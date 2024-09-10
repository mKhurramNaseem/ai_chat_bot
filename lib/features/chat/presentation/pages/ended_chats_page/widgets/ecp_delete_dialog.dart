import 'package:ai_chat_bot/core/core.dart';

class EcpDeleteDialog extends StatelessWidget {
  const EcpDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.sizeOf(context).width * 0.1,
          MediaQuery.sizeOf(context).height * 0.2,
          MediaQuery.sizeOf(context).width * 0.1,
          MediaQuery.sizeOf(context).height * 0.2),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Spacer(
              flex: 8,
            ),
            Expanded(
              flex: 84,
              child: Column(
                children: [
                  const Spacer(
                    flex: 10,
                  ),
                  Expanded(
                    flex: 32,
                    child: Image.asset(
                      AppImages.crossEyedImage,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Delete Chat?',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: Text(
                      'Are you sure you want to delete this ended chat?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Yes, Delete'),
                        ),
                      );
                    }),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 11,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.white,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              AppColors.cyan,
                            ),
                          ),
                          child: const Text('Cancel'),
                        ),
                      );
                    }),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
