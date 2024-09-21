import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/image_edit_page/widgets/iep_icons_transition.dart';

class IepIconsBar extends StatefulWidget {
  const IepIconsBar({super.key});

  @override
  State<IepIconsBar> createState() => _IepIconsBarState();
}

class _IepIconsBarState extends State<IepIconsBar>
    with SingleTickerProviderStateMixin {
  bool changeIcon = false;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          final bloc = context.read<ImageEditBloc>();
          if (bloc.state is ImageEditSimpleState) {
            Navigator.of(context).pop();
          } else {
            animationController.reverse();
            bloc.add(
                const ImageEditEvent(pageType: ImageEditPageType.simpleType));
            context.read<CanvasBloc>().add(CanvasInitialEvent());
          }
        }
      },
      child: Positioned.fill(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 15.0,
            ),
            child: IconsBarTransition(
              context: context,
              listenable: animationController,
              cropIconOnTap: () {},
              shapeIconOnTap: () {
                animationController.forward();
                context.read<ImageEditBloc>().add(const ImageEditEvent(
                    pageType: ImageEditPageType.shapeDrawingType));
                final bloc =
                    context.read<CanvasBloc>().shape = ShapeType.rectangle;
                changeIcon = true;
              },
              editIconOnTap: () {
                if (animationController.isCompleted) {
                  context.read<ImageEditBloc>().add(const ImageEditEvent(
                      pageType: ImageEditPageType.simpleType));
                  context.read<WidgetToImageConversionBloc>().add(
                      WidgetToImageConversionEvent(
                          widgetKey: context.read<GlobalKey>()));
                  animationController.reverse();
                  changeIcon = false;
                } else {
                  animationController.forward();
                  context.read<ImageEditBloc>().add(const ImageEditEvent(
                      pageType: ImageEditPageType.drawingType));
                  final bloc =
                      context.read<CanvasBloc>().shape = ShapeType.customLine;
                  changeIcon = false;
                }
              },
              cancelIconOnTap: () {
                animationController.reverse();
                context.read<ImageEditBloc>().add(const ImageEditEvent(
                    pageType: ImageEditPageType.simpleType));
                context.read<CanvasBloc>().add(CanvasInitialEvent());
              },
            ),
          ),
        ),
      ),
    );
  }
}
