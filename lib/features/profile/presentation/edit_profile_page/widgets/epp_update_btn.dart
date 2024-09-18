import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/edit_profile_page/widgets/epp_base_widget.dart';

class EppUpdateBtn extends StatelessWidget {
  const EppUpdateBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: EppBaseWidget(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(0, height * AppConstants.btnSizePercent),
              ),
            ),
            child: const Text('Update'),
          ),
        ),
      ),
    );
  }
}
