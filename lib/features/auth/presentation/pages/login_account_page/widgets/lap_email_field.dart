import 'package:ai_chat_bot/core/core.dart';

class LapEmailField extends SliverToBoxAdapter {
  static const _hint = 'Email';
  LapEmailField({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return LapBaseWidget(
                child: TextFormField(
                  controller: context.read<EmailTextEditingController>(),
                  style: Theme.of(context).textTheme.bodyLarge,             
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
