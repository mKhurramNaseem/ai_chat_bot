import 'package:ai_chat_bot/core/core.dart';

class CpLoadingTile extends StatelessWidget {
  const CpLoadingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Flexible(
            flex: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                              width: constraints.maxWidth * 0.45,
                              child: Image.asset(AppImages.starImage)),
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: SpinKitCircle(
                              color: AppColors.cyan,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 30,
          ),
        ],
      ),
    );
  }
}
