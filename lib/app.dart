import 'package:flutter/material.dart';
import 'package:project_architecture/config/routes/app_router.dart';
import 'package:project_architecture/config/routes/navigation_service.dart';
import 'package:project_architecture/config/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          theme: AppTheme().lightTheme(),
          darkTheme: AppTheme().darkTheme(),
          navigatorKey: NavigationService.navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        );
      },
    );
  }
}
