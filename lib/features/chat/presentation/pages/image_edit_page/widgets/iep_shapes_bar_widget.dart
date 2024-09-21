import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';

class IepShapesBarWidget extends StatelessWidget {
  const IepShapesBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CanvasBloc>();
    return BlocBuilder<ImageEditBloc, ImageEditState>(
        builder: (context, state) {
      if (state is ImageEditSimpleState || state is ImageEditDrawingState) {
        return const SizedBox();
      }
      return Positioned.fill(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, bottom: 20.0),
            child: StatefulBuilder(builder: (context, setState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShapeBaseWidget(
                    iconData: Icons.circle_outlined,
                    isSelected: ShapeType.oval == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.oval,
                    ),
                  ),
                  ShapeBaseWidget(
                    iconData: Icons.rectangle_outlined,
                    isSelected: ShapeType.rectangle == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.rectangle,
                    ),
                  ),
                  ShapeBaseWidget(
                    iconData: Icons.crop_square_rounded,
                    isSelected: ShapeType.rRectangle == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.rRectangle,
                    ),
                  ),
                  ShapeBaseWidget(
                    iconData: Icons.change_history,
                    isSelected: ShapeType.isocelesTriangle == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.isocelesTriangle,
                    ),
                  ),
                  ShapeBaseWidget(
                    iconData: Icons.arrow_back_rounded,
                    angle: 135,
                    isSelected: ShapeType.line == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.line,
                    ),
                  ),
                  ShapeBaseWidget(
                    iconData: Icons.pentagon_outlined,
                    isSelected: ShapeType.pentagon == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.pentagon,
                    ),
                  ),
                  ShapeBaseWidget(
                    iconData: Icons.hexagon_outlined,
                    isSelected: ShapeType.hexagon == bloc.shape,
                    onTap: () => setState(
                      () => bloc.shape = ShapeType.hexagon,
                    ),
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

class ShapeBaseWidget extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final void Function() onTap;
  final double angle;
  const ShapeBaseWidget({
    super.key,
    required this.iconData,
    required this.isSelected,
    this.angle = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
          child: Transform.rotate(
            angle: angle.degToRad,
            child: Icon(
              iconData,
            ),
          ),
        ),
      ),
    );
  }
}
