import 'package:ai_chat_bot/core/core.dart';

class CapRememberBox extends SliverToBoxAdapter {
  static const _checkBoxFlex = 40, _textFlex = 60 , _bottomPadding = 8.0;
  static const _text = 'Remember me';
  CapRememberBox({super.key})
      : super(
          child: CapBaseWidget(
            child: Padding(
              padding: const EdgeInsets.only(bottom: _bottomPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: _checkBoxFlex,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Builder(builder: (context) {
                        var isChecked = false;
                        return StatefulBuilder(builder: (context, setState) {
                          return Checkbox(
                            value: isChecked,
                            onChanged: (value) => setState(
                              () => isChecked = !isChecked,
                            ),
                          );
                        });
                      }),
                    ),
                  ),
                  Expanded(
                    flex: _textFlex,
                    child: Builder(builder: (context) {
                      return Text(
                        _text,
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
}
