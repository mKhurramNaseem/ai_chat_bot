import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/presentation/pages/home_page/widgets/hp_route_observer.dart';
import 'package:ai_chat_bot/injection_container.dart';

final hpNavigatorObserver = HpNavigatorObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initChats();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      // Themes
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      // Routes
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onGenerateInitialRoutes: RouteGenerator.onGenerateInitialRoutes,
      initialRoute: CreateAccountPage.pageName,

      navigatorObservers: [hpNavigatorObserver],
    );
  }
}
