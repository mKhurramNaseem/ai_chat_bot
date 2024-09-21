import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';

class IepUndoRedoWidget extends StatelessWidget {
  const IepUndoRedoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageEditBloc, ImageEditState>(
        builder: (context, state) {
      if (state is ImageEditSimpleState) {
        return const SizedBox.expand();
      }
      return Positioned.fill(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 15.0,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: UndoRedoBaseWidget(
                      iconData: Icons.undo,
                      onTap: () =>
                          context.read<CanvasBloc>().add(CanvasUndoEvent()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: UndoRedoBaseWidget(
                      iconData: Icons.redo,
                      onTap: () =>
                          context.read<CanvasBloc>().add(CanvasRedoEvent()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class UndoRedoBaseWidget extends StatelessWidget {
  final IconData iconData;
  final void Function() onTap;
  const UndoRedoBaseWidget({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width * 0.1,
        width: width * 0.1,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(iconData),
      ),
    );
  }
}
