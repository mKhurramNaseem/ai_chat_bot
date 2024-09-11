import 'package:ai_chat_bot/core/core.dart';

class CapEmailField extends SliverToBoxAdapter {
  static const _hint = 'Email';
  CapEmailField({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return CapBaseWidget(
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
