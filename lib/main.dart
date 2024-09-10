import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/navigation/route_generator.dart';

void main() {
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
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      // Routes
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: WelcomePage.pageName,
    );
  }
}
