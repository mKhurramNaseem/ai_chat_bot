import 'package:ai_chat_bot/core/core.dart';

class LapPasswordField extends SliverToBoxAdapter {
  static const _hint = 'Password', _padding = 8.0;
  LapPasswordField({super.key , required GlobalKey<FormFieldState> passwordKey})
      : super(
          child: Builder(builder: (context) {
            var obscureText = true;
            return StatefulBuilder(builder: (context, setState) {
              return LapBaseWidget(
                child: TextFormField(
                  key: passwordKey,
                  controller: context.read<PasswordTextEditingController>(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  validator: InputValidations.passwordValidator,
                  obscureText: obscureText,
                  obscuringCharacter: AppConstants.obscureCharacter,
                  buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      required maxLength}) {
                    return Text(
                      '$currentLength/$maxLength',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isFocused ? AppColors.cyan : AppColors.grey,
                          ),
                    );
                  },
                  maxLength: AppConstants.maxLengthOfCounter,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)?.password ?? _hint,
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
