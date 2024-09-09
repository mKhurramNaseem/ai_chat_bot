import 'package:ai_chat_bot/core/core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
          child: ColoredBox(
            color: Colors.blueGrey.shade900.withOpacity(0.8),
          ),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.55,
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
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.black,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 17,
                      child: Text(
                        'Your account is ready to use. You will be redirected to the Home page in a few seconds.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
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
