import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/services/record_activity.dart';
import 'package:ai_chat_bot/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_route_observer.dart';
import 'package:ai_chat_bot/injection_container.dart';
import 'package:ai_chat_bot/shared/domain/usecases/get_email_usecase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  runApp(MyApp(
    email: email,
  ));
}

class MyApp extends StatelessWidget {
  final String? email;
  const MyApp({
    super.key,
    required this.email,
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
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        debugShowCheckedModeBanner: false,
        // Themes
        themeMode: ThemeMode.system,
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
          Locale('es'), // Spanish
        ],
        locale: const Locale('es'),
        // Home Page Observer
        navigatorObservers: [hpNavigatorObserver],
      ),
    );
  }
}
