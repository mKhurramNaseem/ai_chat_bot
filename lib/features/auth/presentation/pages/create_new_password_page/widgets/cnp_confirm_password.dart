import 'package:ai_chat_bot/core/core.dart';

class CnpConfirmPassword extends StatelessWidget {
  static const _hint = 'Confirm Password', _padding = 8.0;
  const CnpConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var obscureText = true;
    return StatefulBuilder(builder: (context, setState) {
      return CnpBaseWidget(
        child: TextFormField(
          controller: context.read<ConfirmPasswordTextEditingController>(),
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
            hintText: AppLocalizations.of(context)?.confirmPassword ?? _hint,
            helperText: '',
            prefixIcon: AppIcons.passwordFieldIcon,
            suffixIcon: GestureDetector(
              onTap: () => setState(
                () => obscureText = !obscureText,
              ),
              child: Padding(
                padding: const EdgeInsets.all(_padding),
                child: obscureText ? AppIcons.hideIcon : AppIcons.showIcon,
              ),
            ),
          ),
        ),
      );
    });
  }
}
