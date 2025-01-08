import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/services/record_activity.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_route_observer.dart';
import 'package:ai_chat_bot/features/settings/domain/usecases/get_language_usecase.dart';
import 'package:ai_chat_bot/features/settings/domain/usecases/get_mode_usecase.dart';
import 'package:ai_chat_bot/features/settings/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:ai_chat_bot/features/settings/presentation/bloc/mode_bloc/mode_bloc.dart';
import 'package:ai_chat_bot/injection_container.dart';
import 'package:ai_chat_bot/shared/domain/usecases/get_email_usecase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final hpNavigatorObserver = HpNavigatorObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize all dependencies
  await initDependencies();
  // This Function starts recording activity
  recordActivity();
  // Starts The App
  var getEmailUsecase = sl<GetEmailUsecase>();
  var email = getEmailUsecase();
  var getLanguageUsecase = sl<GetLanguageUsecase>();
  var language = getLanguageUsecase();
  var getModeUsecase = sl<GetModeUsecase>();
  var mode = getModeUsecase();

  runApp(MyApp(
    email: email,
    language: language,
    mode: mode,
  ));
}

class MyApp extends StatelessWidget {
  final String? email;
  final String? language;
  final bool? mode;
  const MyApp({
    super.key,
    required this.email,
    required this.language,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VerifyOtpBloc>(
          create: (context) => VerifyOtpBloc(
            verifyOtpUsecase: sl(),
          ),
        ),
        BlocProvider<LanguageBloc>(
          create: (context) => LanguageBloc(
            setLanguageUsecase: sl(),
          ),
        ),
        BlocProvider<ModeBloc>(
          create: (context) => ModeBloc(
            setModeUsecase: sl(),
          ),
        ),
      ],
      child:
          BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
        // Update current locale based on LanguageState if updated or default to English
        String currentLocale;
        if (state is LanguageUpdatedState) {
          currentLocale = state.locale;
        } else {
          currentLocale = language != null ? language! : 'en';
        }

        return BlocBuilder<ModeBloc,ModeState>(
          builder: (context , state) {

            ThemeMode themeMode = ThemeMode.system;
            if(mode != null){
              if(state is ModeUpdateState){
              themeMode = state.mode ? ThemeMode.dark : ThemeMode.light;
            }else{
              themeMode = mode! ? ThemeMode.dark : ThemeMode.light;
            }
            }            

            
            return MaterialApp(
              title: AppConstants.appTitle,
              debugShowCheckedModeBanner: false,
              // Themes
              themeMode: themeMode,
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.lightTheme,
              // Routes
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              onGenerateInitialRoutes: RouteGenerator.onGenerateInitialRoutes,
              initialRoute:
                  email == null ? CreateAccountPage.pageName : HomePage.pageName,
              // Localizations
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('es'),
                Locale('ur'),
                Locale('hi'), // Spanish
              ],
              locale: Locale(currentLocale),
              // Home Page Observer
              navigatorObservers: [hpNavigatorObserver],
            );
          }
        );
      }),
    );
  }
}
