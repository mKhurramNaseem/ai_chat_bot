import 'package:ai_chat_bot/core/core.dart';

class CapMaxSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.06;
  CapMaxSpace({super.key})
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

class CapMedSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.04;
  CapMedSpace({super.key})
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

class CapMinSpace extends SliverToBoxAdapter {
  static const _spacePercent = 0.01;
  CapMinSpace({super.key})
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
