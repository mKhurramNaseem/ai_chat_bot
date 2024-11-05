import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/fill_profile_bloc/fill_profile_bloc.dart';
import 'package:ai_chat_bot/injection_container.dart';

class FillProfilePage extends StatelessWidget {
  static const pageName = '/fillProfilePage';
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FillProfileBloc>(create: (context) => FillProfileBloc(sl(),sl(),sl()),child: FillProfilePageBody(),);
  }
}


class FillProfilePageBody extends StatefulWidget {  
  const FillProfilePageBody({super.key});

  @override
  State<FillProfilePageBody> createState() => _FillProfilePageBodyState();
}

class _FillProfilePageBodyState extends State<FillProfilePageBody> {

  late UserNameTextEditingController userNameTextEditingController;
  late NickNameTextEditingController nickNameTextEditingController;
  late DateOfBirthTextEditingController dateOfBirthTextEditingController;
  late EmailTextEditingController emailTextEditingController;
  final GlobalKey<FormState> validationKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userNameTextEditingController = UserNameTextEditingController();
    nickNameTextEditingController = NickNameTextEditingController();
    dateOfBirthTextEditingController = DateOfBirthTextEditingController();
    emailTextEditingController = EmailTextEditingController();
  }

  @override
  void dispose() {
    userNameTextEditingController.dispose();
    nickNameTextEditingController.dispose();
    dateOfBirthTextEditingController.dispose();
    emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<UserNameTextEditingController>(
          create: (context) => userNameTextEditingController,
        ),
        ListenableProvider<NickNameTextEditingController>(
          create: (context) => nickNameTextEditingController,
        ),
        ListenableProvider<DateOfBirthTextEditingController>(
          create: (context) => dateOfBirthTextEditingController,
        ),
        ListenableProvider<EmailTextEditingController>(
          create: (context) => emailTextEditingController,
        ),
        Provider<GlobalKey<FormState>>(
          create: (context) => validationKey,
        ),
      ],
      child: Scaffold(
        appBar: FppAppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height -
                  kToolbarHeight -
                  MediaQuery.paddingOf(context).top,
              child: Form(
                key: validationKey,
                child: const Column(
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
                      child: FppDateOfBirthField(),
                    ),
                    Expanded(
                      flex: 12,
                      child: FppGenderField(),
                    ),
                    Expanded(
                      flex: 19,
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
        ),
      ),
    );
  }
}
