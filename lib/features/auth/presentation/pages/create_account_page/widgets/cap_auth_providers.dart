import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_images.dart';

class CapAuthProviders extends SliverToBoxAdapter {
  static const _heightPercent = 0.05, _googleIconPadding = 4.0;
  CapAuthProviders({super.key})
      : super(
          child: Builder(builder: (context) {
            final height = MediaQuery.sizeOf(context).height;
            return SizedBox(
              height: height * _heightPercent,
              child: CapBaseWidget(
                child: Row(
                  children: [
                    const Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(_googleIconPadding),
                        child: SvgPicture.asset(
                          AppImages.googleSvg,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(Icons.apple),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
}
