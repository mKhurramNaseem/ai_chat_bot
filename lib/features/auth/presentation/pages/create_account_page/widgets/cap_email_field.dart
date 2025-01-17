import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CapEmailField extends SliverToBoxAdapter {
  static const _hint = 'Email';
  CapEmailField({super.key , required GlobalKey<FormFieldState> emailValidationKey})
      : super(
          child: Builder(
            builder: (context) {
              return CapBaseWidget(
                child: BlocBuilder<VerifyOtpBloc,VerifyOtpState>(
                  builder: (context , state) {
                    return TextFormField(
                      key: emailValidationKey,
                      readOnly: state is VerifyOtpSuccessfulState,
                      controller: context.read<EmailTextEditingController>(),
                      style: Theme.of(context).textTheme.bodyLarge,               
                      validator: InputValidations.emailValidatior,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)?.email ?? _hint,                    
                        prefixIcon: AppIcons.emailFieldIcon,
                        helperText: '',
                      ),                  
                    );
                  }
                ),
              );
            }
          ),
        );
}
