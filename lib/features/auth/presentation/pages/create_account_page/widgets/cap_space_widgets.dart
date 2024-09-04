import 'package:ai_chat_bot/core/core.dart';

class CapTopSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.08;
  CapTopSpace({super.key})
      : super(
          child: Builder(
            builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              return SizedBox(
                height: height * _spacePercent,
              );
            },
          ),
        );
}

class CapMiddleSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.04;
  CapMiddleSpace({super.key})
      : super(
          child: Builder(
            builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              return SizedBox(
                height: height * _spacePercent,
              );
            },
          ),
        );
}

class CapBottomSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.01;
  CapBottomSpace({super.key})
      : super(
          child: Builder(
            builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              return SizedBox(
                height: height * _spacePercent,
              );
            },
          ),
        );
}
