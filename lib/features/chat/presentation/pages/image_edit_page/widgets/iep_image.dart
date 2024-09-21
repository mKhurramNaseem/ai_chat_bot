import 'dart:developer';
import 'dart:io';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/image_edit_page/widgets/iep_painter.dart';

class IepImage extends StatelessWidget {
  const IepImage({super.key});

  @override
  Widget build(BuildContext context) {
    var file = ModalRoute.of(context)!.settings.arguments as File;
    log('Rebuild');
    return Positioned.fill(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Center(
          child: RepaintBoundary(
            key: context.read<GlobalKey>(),
            child: Builder(builder: (context) {
              Shape shape = Line(begin: Offset.zero, end: Offset.zero);
              List<Shape> track = [];
              return BlocBuilder<CanvasBloc, CanvasState>(
                  builder: (context, state) {
                log("Rebuilding");
                if (state is CanvasUpdatedState) {
                  shape = state.current;
                  track = state.track;
                }
                return CustomPaint(
                  foregroundPainter: IepPainter(
                    shape: shape,
                    track: track,
                  ),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: BlocBuilder<WidgetToImageConversionBloc,
                            WidgetToImageConversionState>(
                        builder: (context, state) {                          
                      if (state is WidgetToImageConversionDoneState) {
                        log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                        file = state.imageFile;
                      }
                      return Image.file(file);
                    }),
                  ),
                );
              });
            }),
          ),
        ),
      ),
    );
  }
}
