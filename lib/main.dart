import 'package:ai_chat_bot/core/core.dart';

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
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      // Routes
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onGenerateInitialRoutes: RouteGenerator.onGenerateInitialRoutes,
      initialRoute: HomePage.pageName,
    );
  }
}
