import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_islami/component/my_divider.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_quran_tab_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/tabs/quran/click_sura_name.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            'assets/images/quran_image.png',
          ),
        ),
        Consumer<MyThemeProvider>(
          builder: (context, provider, child) => MyDivider(
            color: provider.mode == ThemeMode.light
                ? Theme.of(context).primaryColor
                : MyTheme.goldColor,
            thickness: 3,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.sura_name,
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
        Consumer<MyThemeProvider>(
          builder: (context, provider, child) => MyDivider(
            color: provider.mode == ThemeMode.light
                ? Theme.of(context).primaryColor
                : MyTheme.goldColor,
            thickness: 3,
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            itemBuilder: (context, index) => ClickSuraName(
              text: ' سورة ${context.read<MyQuranTabProvider>().titles[index]}',
              index: index,
            ),
            separatorBuilder: (context, index) => Consumer<MyThemeProvider>(
              builder: (context, provider, child) => MyDivider(
                color: provider.mode == ThemeMode.light
                    ? Theme.of(context).primaryColor
                    : MyTheme.goldColor,
                thickness: 3,
              ),
            ),
            itemCount: 50,
          ),
        ),
      ],
    );
  }
}
