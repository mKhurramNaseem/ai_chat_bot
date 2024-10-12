import 'dart:io';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/image_edit_page/widgets/iep_painter.dart';

class IepImage extends StatelessWidget {
  const IepImage({super.key});

  @override
  Widget build(BuildContext context) {
    Shape shape = context.read<CanvasBloc>().currentShape;
    List<Shape> track = context.read<CanvasBloc>().previous;
    var file = ModalRoute.of(context)!.settings.arguments as File;
    return Positioned.fill(
      child: GestureDetector(
        onPanDown: (details) {
          context.read<CanvasBloc>().add(CanvasStartEvent(
                details: details,
              ));
        },
        onPanUpdate: (details) {
          context.read<CanvasBloc>().add(CanvasUpdateEvent(details: details));
        },
        onPanEnd: (details) {
          context.read<CanvasBloc>().add(CanvasEndEvent(details: details));
        },
        child: Center(
          child: RepaintBoundary(
            key: context.read<GlobalKey>(),
            child:
                BlocBuilder<CanvasBloc, CanvasState>(builder: (context, state) {
              if (state is CanvasUpdatedState) {
                shape = state.current;
                track = state.track;
              }
              return CustomPaint(
                foregroundPainter: IepPainter(
                  shape: shape,
                  track: track,
                  drawEnable: context.read<ImageEditBloc>().state
                      is! ImageEditSimpleState,
                ),
                child: BlocBuilder<WidgetToImageConversionBloc,
                    WidgetToImageConversionState>(
                  builder: (context, state) {
                    if (state is WidgetToImageConversionDoneState) {
                      file = state.imageFile;
                    }
                    return Center(
                      child: Image.file(
                        file,
                      ),
                    );
                  },
                ),
              );
            }),
          ),          
        ),
      ),
    );
  }
}
