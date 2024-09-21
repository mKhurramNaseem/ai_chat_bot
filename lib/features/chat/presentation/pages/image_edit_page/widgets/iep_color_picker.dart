import 'package:ai_chat_bot/core/core.dart';

class IepColorPicker extends StatelessWidget {
  const IepColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorPicker(
            wheelDiameter: 150,
            onColorChanged: (value) {},
            enableTonalPalette: false,
            // wheelSquareBorderRadius: ,
            wheelHasBorder: false,
            enableShadesSelection: false,
            pickersEnabled: const {
              ColorPickerType.primary: false,
              ColorPickerType.wheel: true,
              ColorPickerType.accent: false,
            },
          ),
        ],
      ),
    );
  }
}
