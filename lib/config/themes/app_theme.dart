import 'package:project_architecture/config/themes/app_colors.dart';
import 'package:project_architecture/exports.dart';

class AppTheme {
  
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: false,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 18.sp,
        )
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}
