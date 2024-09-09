import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/pages/login_account_page/widgets/lap_base_widget.dart';

class LapEmailField extends SliverToBoxAdapter {
  static const _hint = 'Email';
  LapEmailField({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: TextFormField(
                  controller: context.read<EmailTextEditingController>(),
                  style: const TextStyle(
                    color: AppColors.black,
                    fontFamily: AppTextStyleAttributes.titleFontFamily,
                  ),                  
                  validator: InputValidations.emailValidatior,
                  decoration: const InputDecoration(
                    hintText: _hint,                    
                    prefixIcon: AppIcons.emailFieldIcon,
                    helperText: '',
                  ),
                ),
              );
            }
          ),
        );
}
