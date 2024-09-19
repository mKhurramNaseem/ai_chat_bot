import 'dart:math' as math;
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_base_widgets.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/ended_chats_page/widgets/ecp_delete_dialog.dart';

class EcpListTile extends StatefulWidget {
  static const _startSpace = 5,
      _middleSpace = 3,
      _tileTextsFlex = 57,
      _imageFlex = 30;
  static const _padding = 0.01, _heightPercent = 0.15;
  const EcpListTile({super.key});

  @override
  State<EcpListTile> createState() => _EcpListTileState();
}

class _EcpListTileState extends State<EcpListTile> {
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
    final height = MediaQuery.sizeOf(context).height -
        kToolbarHeight -
        MediaQuery.paddingOf(context).top;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * EcpListTile._padding),
      child: GestureDetector(
        onTap: () {},
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
              height: height * EcpListTile._heightPercent,
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
                        child: Container(
                          height: height * EcpListTile._heightPercent,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            color: AppColors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(
                                flex: 80,
                              ),
                              Expanded(
                                flex: 20,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const EcpDeleteDialog(),
                                    );
                                    setState(() {
                                      padding = 1;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: padding,
                        ),
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
                                flex: EcpListTile._startSpace,
                              ),
                              Expanded(
                                flex: EcpListTile._imageFlex,
                                child: Image.asset(
                                  AppImages.simpleImage,
                                ),
                              ),
                              const Spacer(
                                flex: EcpListTile._middleSpace,
                              ),
                              const Expanded(
                                flex: EcpListTile._tileTextsFlex,
                                child: EcpEndedChatsTileTexts(),
                              ),
                              const Spacer(
                                flex: EcpListTile._startSpace,
                              ),
                            ],
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

class EcpEndedChatsTileTexts extends StatelessWidget {
  static const _titleTextFlex = 47, _spacer = 3, _messageFlex = 50;
  static const _titleFontSize = 0.32, _messageFontSize = 0.22;
  static const _title = '${AppConstants.botName}-Dec 19, 2024',
      _message =
          'Hello Khurram! I\'m Bobo How are you today?? Hello Khurram! I\'m Bobo How are you today??';
  static const _maxLines = 2;
  const EcpEndedChatsTileTexts({super.key});

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
                  _title,
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
                  _message,
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
