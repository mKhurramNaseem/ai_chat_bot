import 'dart:io';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/edit_image_bloc/edit_image_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/image_edit_page/widgets/iep_chat_field.dart';

class ImageEditPage extends StatelessWidget {
  static const pageName = '/imageEditPage';
  const ImageEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditImageBloc>(
      create: (context) => EditImageBloc(),
      child: const ImageEditPageBody(),
    );
  }
}

class ImageEditPageBody extends StatefulWidget {
  const ImageEditPageBody({super.key});

  @override
  State<ImageEditPageBody> createState() => _ImageEditPageState();
}

class _ImageEditPageState extends State<ImageEditPageBody> {
  late ChatTextEditingController chatController;
  final key = GlobalKey();

  @override
  void initState() {
    super.initState();
    chatController = ChatTextEditingController();
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context)!.settings.arguments as File;
    return MultiProvider(
      providers: [
        ListenableProvider<ChatTextEditingController>(
          create: (context) => chatController,
        ),
        Provider<GlobalKey>(
          create: (context) => key,
        ),
      ],
      child: BlocListener<EditImageBloc, EditImageState>(
        listener: _editImageBlocListener,
        child: Scaffold(
          body: Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: Center(
                        child: RepaintBoundary(
                          key: key,
                          child: Stack(
                            children: [
                              Image.file(file),
                              CustomPaint(
                                painter: DrawingPainter(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IepChatField(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editImageBlocListener(BuildContext context, state) {
    if (state is EditImageDoneState) {
      Navigator.of(context).pop(ChatMessage(
          isSender: true,
          message: chatController.text.trim(),
          image: state.imageBytes));
    }
  }
}

class DrawingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawRect(
    //   const Rect.fromLTWH(0, 0, 200, 300),
    //   Paint()
    //     ..color = Colors.red
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 5,
    // );
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(DrawingPainter oldDelegate) => false;
}
