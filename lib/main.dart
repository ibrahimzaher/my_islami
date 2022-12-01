import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_islami/home_screen.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_bottom_nav_bar_provider.dart';
import 'package:my_islami/provider/my_hades_provider.dart';
import 'package:my_islami/provider/my_language_provider.dart';
import 'package:my_islami/provider/my_quran_tab_provider.dart';
import 'package:my_islami/provider/my_sebha_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/shared_preferences/my_shared_prefernces.dart';
import 'package:my_islami/tabs/hades/hades_details_screen.dart';
import 'package:my_islami/tabs/quran/quran_details_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  String value = MySharedPreferences.getLanguage() ?? 'ar';
  bool theme = MySharedPreferences.getTheme() ?? true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              MyThemeProvider(mode: (theme) ? ThemeMode.light : ThemeMode.dark),
        ),
        ChangeNotifierProvider(
          create: (_) => MyLanguageProvider(language: value),
        ),
        ChangeNotifierProvider(
          create: (_) => MyBottomNavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyQuranTabProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyHadesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MySebhaProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranDetailsScreen.routeName: (_) => const QuranDetailsScreen(),
        HadesDetailsScreen.routeName: (_) => const HadesDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<MyThemeProvider>().mode,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: Locale(context.watch<MyLanguageProvider>().language),
    );
  }
}
