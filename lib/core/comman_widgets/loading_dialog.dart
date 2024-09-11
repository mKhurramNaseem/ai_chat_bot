import 'package:ai_chat_bot/core/core.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Container(
            color: Theme.of(context).dialogTheme.barrierColor,
          ),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.55,
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).dialogTheme.backgroundColor,
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
                      flex: 38,
                      child: Image.asset(
                        AppImages.starImage,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        'Congratulations!',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Expanded(
                      flex: 17,
                      child: Text(
                        'Your account is ready to use. You will be redirected to the Home page in a few seconds.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const Expanded(
                      flex: 10,
                      child: SpinKitCircle(
                        color: AppColors.cyan,
                      ),
                    ),
                    const Spacer(
                      flex: 10,
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
      ],
    );
  }
}
