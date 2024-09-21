import 'dart:developer';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';

class IepStrokeBarWidget extends StatelessWidget {
  const IepStrokeBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CanvasBloc>();
    return BlocBuilder<ImageEditBloc, ImageEditState>(
        builder: (context, state) {
      if (state is ImageEditSimpleState) {
        return const SizedBox();
      }
      return Positioned.fill(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                right: 15.0, bottom: MediaQuery.sizeOf(context).height * 0.1),
            child: StatefulBuilder(builder: (context, setState) {
              log('Rebuilds ????????????????????????????????????????? ${bloc.stroke}');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StrokeBaseWidget(
                    iconData: Icons.circle,
                    strokeType: StrokeType.thin,
                    isSelected: StrokeType.thin == bloc.stroke,
                    onTap: () {
                      setState(() => bloc.stroke = StrokeType.thin);
                    },
                  ),
                  StrokeBaseWidget(
                    iconData: Icons.circle,
                    strokeType: StrokeType.medium,
                    isSelected: StrokeType.medium == bloc.stroke,
                    onTap: () {
                      setState(() => bloc.stroke = StrokeType.medium);
                    },
                  ),
                  StrokeBaseWidget(
                    iconData: Icons.circle,
                    strokeType: StrokeType.thick,
                    isSelected: StrokeType.thick == bloc.stroke,
                    onTap: () {
                      log('Clicked');
                      setState(() => bloc.stroke = StrokeType.thick);
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}

class StrokeBaseWidget extends StatelessWidget {
  final IconData iconData;
  final StrokeType strokeType;
  final bool isSelected;
  final void Function() onTap;
  const StrokeBaseWidget({
    super.key,
    required this.iconData,
    required this.strokeType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: width * 0.1,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimaryContainer,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, constraints) {
            double percent;
            if (strokeType == StrokeType.thin) {
              percent = 0.2;
            } else if (strokeType == StrokeType.medium) {
              percent = 0.35;
            } else {
              percent = 0.5;
            }
            return Icon(
              iconData,
              size: constraints.maxHeight * percent,
            );
          }),
        ),
      ),
    );
  }
}
