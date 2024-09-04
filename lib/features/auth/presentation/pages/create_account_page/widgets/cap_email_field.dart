import 'package:ai_chat_bot/core/core.dart';

class CapEmailField extends SliverToBoxAdapter {
  static const _hint = 'Email';
  CapEmailField({super.key})
      : super(
          child: CapBaseWidget(
            child: TextFormField(
              style: const TextStyle(
                color: AppColors.black,
                fontFamily: AppTextStyleAttributes.titleFontFamily,
              ),
              decoration: const InputDecoration(
                hintText: _hint,
                prefixIcon: AppIcons.emailFieldIcon,
                helperText: '',
              ),
            ),
          ),
        );
}
