import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/features/profile/presentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:ai_chat_bot/injection_container.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends StatelessWidget {
  static const pageName = '/editProfilePage';
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileBloc>(
      create: (context) => EditProfileBloc(sl() , sl(),),
      child: const EditProfilePageBody(),
    );
  }
}

class EditProfilePageBody extends StatefulWidget {
  const EditProfilePageBody({super.key});

  @override
  State<EditProfilePageBody> createState() => _EditProfilePageBodyState();
}

class _EditProfilePageBodyState extends State<EditProfilePageBody> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userProfile =
        ModalRoute.of(context)?.settings.arguments as UserProfile?;
    if (userProfile != null) {
      userNameTextEditingController.text = userProfile.name;
      nickNameTextEditingController.text = userProfile.nickName;
      dateOfBirthTextEditingController.text =
          DateFormat(DateFormat.YEAR_MONTH_DAY).format(userProfile.dateOfBirth);
      emailTextEditingController.text = userProfile.email;
    }
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
      child: BlocListener<EditProfileBloc, EditProfileState>(
        listener: _editProfileBlocListener,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: EppAppBar(),
          body: Center(
            child: Form(
              key: validationKey,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                  ),
                  // Full name
                  EppFullNameField(),
                  // Nick name
                  EppNickNameField(),
                  // Date of birth
                  EppDateOfBirthField(),
                  // Email
                  EppEmailField(),
                  // Gender
                  EppGenderField(),
                  // Update Button
                  Expanded(
                    child: EppUpdateBtn(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editProfileBlocListener(BuildContext context, EditProfileState state) {
    if (state is EditProfileLoadedState) {
      Navigator.of(context).pop();
    }
  }
}
