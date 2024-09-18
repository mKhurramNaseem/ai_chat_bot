import 'package:ai_chat_bot/core/core.dart';

class FppProfileImage extends StatelessWidget {
  const FppProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.black,
              radius: constraints.maxHeight / 2,
            ),
            GestureDetector(
              onTap: () async {
                await ImagePicker().pickImage(source: ImageSource.gallery);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Icon(
                  Icons.edit,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}