import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_app_bar.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_date_of_birth_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_email_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_full_name_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_gender_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_nick_name_field.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_update_btn.dart';

class EditProfilePage extends StatelessWidget {
  static const pageName = '/editProfilePage';
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: EppAppBar(),
      body: const Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
            ),
            EppFullNameField(),
            EppNickNameField(),
            EppDateOfBirthField(),
            EppEmailField(),
            EppGenderField(),
            Expanded(
              child: EppUpdateBtn(),
            ),
          ],
        ),
      ),
    );
  }
}
