import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/widgets/fpp_app_bar.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/widgets/fpp_continue_btn.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/widgets/fpp_email_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/widgets/fpp_full_name_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/widgets/fpp_nick_name_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/fill_profile_page/widgets/fpp_profile_image.dart';

class FillProfilePage extends StatelessWidget {
  static const pageName = '/fillProfilePage';
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: FppAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height - kToolbarHeight - MediaQuery.paddingOf(context).top,
            child:const Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 26,
                  child: FppProfileImage(),
                ),
                Spacer(
                  flex: 5,
                ),
                Expanded(
                  flex: 12,
                  child: FppFullNameField(),
                ),
                Expanded(
                  flex: 12,
                  child: FppNickNameField(),
                ),
                Expanded(
                  flex: 12,
                  child: FppEmailField(),
                ),
                Expanded(
                  flex: 31,
                  child: FppContinueBtn(),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
