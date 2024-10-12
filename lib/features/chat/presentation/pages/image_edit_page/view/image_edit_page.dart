import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/canvas_bloc/canvas_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/image_edit_page/widgets/iep_chat_field.dart';

class ImageEditPage extends StatelessWidget {
  static const pageName = '/imageEditPage';
  const ImageEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WidgetToImageConversionBloc>(
          create: (context) => WidgetToImageConversionBloc(),
        ),
        BlocProvider<ImageEditBloc>(
          create: (context) => ImageEditBloc(),
        ),
        BlocProvider<CanvasBloc>(
          create: (context) => CanvasBloc(),
        ),
      ],
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
    
    return MultiProvider(
      providers: [
        ListenableProvider<ChatTextEditingController>(
          create: (context) => chatController,
        ),
        Provider<GlobalKey>(
          create: (context) => key,
        ),       
      ],
      child: BlocListener<WidgetToImageConversionBloc,
          WidgetToImageConversionState>(
        listener: _editImageBlocListener,
        child: Scaffold(
          body: Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  const IepImage(),
                  BlocBuilder<ImageEditBloc, ImageEditState>(
                      builder: (context, state) {
                    if (state is ImageEditSimpleState) {
                      return const IepChatField();
                    }
                    return const SizedBox.expand();
                  }),
                  const IepIconsBar(),
                  const IepUndoRedoWidget(),
                  const IepStrokeBarWidget(),
                  const IepShapesBarWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editImageBlocListener(BuildContext context, state)async {
    if (state is WidgetToImageConversionNavigateState) {      
      Navigator.of(context).pop(ChatMessage(
          isSender: true,
          message: chatController.text.trim(),
          image: state.imageBytes));
    }
  }
}
