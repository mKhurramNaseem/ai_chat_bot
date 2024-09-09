import 'package:ai_chat_bot/core/core.dart';

class LapMaxSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.06;
  LapMaxSpace({super.key})
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

class LapMedSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.025;
  LapMedSpace({super.key})
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

class LapMinSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.01;
  LapMinSpace({super.key})
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
