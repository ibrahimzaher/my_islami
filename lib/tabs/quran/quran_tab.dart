import 'package:flutter/material.dart';
import 'package:my_islami/component/my_divider.dart';
import 'package:my_islami/component/reusable_tab.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_quran_tab_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/tabs/quran/click_sura_name.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ReusableTab(
      image: 'assets/images/quran_image.png',
      widget: ListView.separated(
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
        itemCount: context.read<MyQuranTabProvider>().titles.length,
      ),
    );
  }
}
