import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati/core/services/local/hive_helper.dart';
import 'package:taskati/features/taskDetailes/pages/task_screen.dart';

import 'core/styles/themes.dart';
import 'features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.userBox.listenable(),
      builder: (BuildContext context, value, child) {
        bool isDark = HiveHelper.getData(HiveHelper.kIsDark) ?? false;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: SplashScreen(),
        );
      },
    );
  }
}
