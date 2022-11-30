import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_islami/provider/my_bottom_nav_bar_provider.dart';
import 'package:my_islami/provider/my_hades_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home_screen';
  @override
  Widget build(BuildContext context) {
    if (context.watch<MyHadesProvider>().titles.isEmpty) {
      context.read<MyHadesProvider>().readFile();
    }
    return Stack(
      children: [
        Consumer<MyThemeProvider>(
          builder: (context, provider, child) => Image.asset(
            (provider.mode == ThemeMode.light
                ? 'assets/images/bg.png'
                : 'assets/images/bg_dark.png'),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Consumer<MyBottomNavBarProvider>(
          builder: (context, provider, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.islami,
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
            body: provider.tabs[provider.currentIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor,
              ),
              child: BottomNavigationBar(
                currentIndex: provider.currentIndex,
                onTap: (index) {
                  provider.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/icons/quran.png',
                      ),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.quran,
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/icons/hades.png',
                      ),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.ahdadeth,
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/icons/sebha.png',
                      ),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.sebha,
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/icons/radio.png',
                      ),
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.radio,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    label: AppLocalizations.of(context)!.settings,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
