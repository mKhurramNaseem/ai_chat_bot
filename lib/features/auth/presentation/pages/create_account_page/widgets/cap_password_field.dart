import 'package:ai_chat_bot/core/core.dart';

class CapPasswordField extends SliverToBoxAdapter {
  static const _hint = 'Password', _padding = 8.0;
  CapPasswordField({super.key})
      : super(
          child: Builder(builder: (context) {
            var obscureText = true;
            return StatefulBuilder(builder: (context, setState) {
              return CapBaseWidget(
                child: TextFormField(
                  style: const TextStyle(
                    color: AppColors.black,
                    fontFamily: AppTextStyleAttributes.titleFontFamily,
                  ),
                  obscureText: obscureText,
                  obscuringCharacter: '●',
                  decoration: InputDecoration(
                    hintText: _hint,
                    helperText: '',
                    prefixIcon: AppIcons.passwordFieldIcon,
                    suffixIcon: GestureDetector(
                      onTap: () => setState(
                        () => obscureText = !obscureText,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(_padding),
                        child:
                            obscureText ? AppIcons.hideIcon : AppIcons.showIcon,
                      ),
                    ),
                  ),
                ),
              );
            });
          }),
        );
}
