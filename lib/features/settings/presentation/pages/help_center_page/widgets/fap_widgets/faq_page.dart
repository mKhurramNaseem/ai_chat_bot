import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/domain/model/faq.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/widgets/fap_widgets/faq_list.dart';
import 'package:ai_chat_bot/features/settings/presentation/pages/help_center_page/widgets/fap_widgets/faq_search_bar.dart';

class FaqPart extends StatelessWidget {
  const FaqPart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FaqSearchBar(),
        FaqList(list: list),
      ],
    );
  }
}

List<Faq> list = [
  Faq(
    question: 'What is Bobo?',
    answer:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    isLiked: true,
  ),
  Faq(
    question: 'How to use Bobo?',
    answer:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    isLiked: true,
  ),
  Faq(
    question: 'Is Bobo free to use?',
    answer:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    isLiked: true,
  ),
  Faq(
    question: 'How to send message to Bobo?',
    answer:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    isLiked: true,
  ),
  Faq(
    question: 'How can I leave chat with Bobo?',
    answer:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    isLiked: true,
  ),
  Faq(
    question: 'How do I delete chat with Bobo',
    answer:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    isLiked: true,
  ),
];
