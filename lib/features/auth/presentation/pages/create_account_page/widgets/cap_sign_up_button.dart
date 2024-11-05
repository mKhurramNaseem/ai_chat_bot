
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/pages/fill_profile_page/view/fill_profile_page.dart';

class CapSignUpButton extends SliverToBoxAdapter {
  CapSignUpButton({super.key})
      : super(
          child: Builder(builder: (context) {
            final height = MediaQuery.sizeOf(context).height;
            return CapBaseWidget(
              child: ElevatedButton(
                onPressed: () {                  
                  // if(context.read<GlobalKey<FormState>>().currentState?.validate() ?? false){                  
                  // }                  
                  Navigator.of(context).pushNamed(FillProfilePage.pageName);
                },
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size(0, height * AppConstants.btnSizePercent),
                  ),
                ),
                child: const Text('Sign up'),
              ),
            );
          }),
        );
}
