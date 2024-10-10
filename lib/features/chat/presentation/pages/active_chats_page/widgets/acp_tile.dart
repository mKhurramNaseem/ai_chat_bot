import 'dart:math' as math;
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_params.dart';
import 'package:ai_chat_bot/features/chat/presentation/bloc/active_chats_bloc/active_chats_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/active_chats_page/widgets/acp_delete_dialog.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_base_widgets.dart';

class AcpListTile extends StatefulWidget {
  static const _startSpace = 5,
      _middleSpace = 3,
      _tileTextsFlex = 57,
      _imageFlex = 30;
  static const _padding = 0.01, _heightPercent = 0.15;
  final Chat chat;
  const AcpListTile({
    super.key,
    required this.chat,
  });

  @override
  State<AcpListTile> createState() => _AcpListTileState();
}

class _AcpListTileState extends State<AcpListTile> {
  var previousDistance = 0.0;
  var distance = 0.0;
  var direction = 0.0;
  var isDecreasing = false;
  var degree = 0.0;
  var padding = 1.0;

  double radianToDegree(double radian) {
    return radian * 180 / math.pi;
  }

  @override
  Widget build(BuildContext context) {
    var activeChatsBloc = context.read<ActiveChatsBloc>();
    final height = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        MediaQuery.paddingOf(context).top;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * AcpListTile._padding),
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          setState(() {
            distance = details.localPosition.distance;
            var previousDegree = degree;
            degree = radianToDegree(details.localPosition.direction);
            isDecreasing = degree > previousDegree;
            previousDistance = distance;
          });
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            distance = details.localPosition.distance;
            var previousDegree = degree;
            degree = radianToDegree(details.localPosition.direction);
            isDecreasing = degree > previousDegree;
            if (isDecreasing) {
              if ((distance + 4) < previousDistance) {
                previousDegree = distance;
                if (padding < 70) {
                  padding += 2;
                }
              }
            } else {
              if (distance > (previousDistance + 4)) {
                previousDegree = distance;
                if (padding > 1) {
                  padding -= 2;
                }
              }
            }
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            padding = isDecreasing ? 70 : 1;
          });
        },
        child: EcpBaseWidget(
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: height * AcpListTile._heightPercent,
              width: constraints.maxWidth,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Builder(builder: (context) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          2,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => BlocProvider.value(
                                value: activeChatsBloc,
                                child: AcpDeleteDialog(
                                  chatId: widget.chat.chatId,
                                ),
                              ),
                            );
                            setState(() {
                              padding = 1;
                            });
                          },
                          child: Container(
                            height: height * AcpListTile._heightPercent,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              color: AppColors.red,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Spacer(
                                  flex: 80,
                                ),
                                Expanded(
                                  flex: 20,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: padding,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(ChatPage.pageName,
                                arguments: ChatParams(
                                    isActive: true,
                                    chatId: widget.chat.chatId));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            child: Row(
                              children: [
                                const Spacer(
                                  flex: AcpListTile._startSpace,
                                ),
                                Expanded(
                                  flex: AcpListTile._imageFlex,
                                  child: Image.asset(
                                    AppImages.simpleImage,
                                  ),
                                ),
                                const Spacer(
                                  flex: AcpListTile._middleSpace,
                                ),
                                Expanded(
                                  flex: AcpListTile._tileTextsFlex,
                                  child: AcpActiveChatsTileTexts(
                                    endDate: widget.chat.endTime,
                                    message: widget.chat.lastMessage,
                                  ),
                                ),
                                const Spacer(
                                  flex: AcpListTile._startSpace,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AcpActiveChatsTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 3, _messageFlex = 50;
  static const _titleFontSize = 0.32, _messageFontSize = 0.22;
  static const _title = AppConstants.botName;
  static const _maxLines = 2;
  final String message;
  final DateTime endDate;
  const AcpActiveChatsTileTexts({
    super.key,
    required this.message,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _titleTextFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '$_title-${endDate.month} ${endDate.day}, ${endDate.year}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: constraints.maxHeight * _titleFontSize,
                      ),
                ),
              );
            },
          ),
        ),
        const Spacer(
          flex: _spacer,
        ),
        Expanded(
          flex: _messageFlex,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topLeft,
                child: Text(
                  message,
                  maxLines: _maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.grey,
                        fontSize: constraints.maxHeight * _messageFontSize,
                      ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
