import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:ai_chat_bot/injection_container.dart';

class SettingsPage extends StatelessWidget {
  static const pageName = '/settingsPage';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SettingsBloc>(
        create: (context) {
          return SettingsBloc(
            getUserUsecase: sl(),
            getEmailUsecase: sl(),
          );
        },
      ),
    ], child: const SettingsPageBody());
  }
}

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({super.key});

  @override
  State<SettingsPageBody> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    context.read<SettingsBloc>().add(SettingsGetDataEvent());
    return Scaffold(
      appBar: SpAppBar(),
      body: const Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 26,
              child: SpProfileImage(),
            ),
            Expanded(
              flex: 8,
              child: SpTitle(),
            ),
            Expanded(
              flex: 5,
              child: SpEmailText(),
            ),
            Expanded(
              flex: 7,
              child: SpEditProfileTile(),
            ),
            Expanded(
              flex: 7,
              child: SpLanguageTile(),
            ),
            Expanded(
              flex: 7,
              child: SpDarkModeTile(),
            ),
            Expanded(
              flex: 7,
              child: SpHelpCenterTile(),
            ),
            Expanded(
              flex: 7,
              child: SpLogoutTile(),
            ),
            Spacer(
              flex: 25,
            ),
          ],
        ),
      ),
    );
  }
}
