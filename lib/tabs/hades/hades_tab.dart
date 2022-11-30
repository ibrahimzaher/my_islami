import 'package:flutter/material.dart';
import 'package:my_islami/component/my_divider.dart';
import 'package:my_islami/component/reusable_tab.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_hades_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/tabs/hades/click_hades_name.dart';
import 'package:provider/provider.dart';

class HadesTab extends StatelessWidget {
  const HadesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableTab(
      image: 'assets/images/hades_image.png',
      widget: Consumer<MyHadesProvider>(
        builder: (context, provider, child) => ListView.separated(
          separatorBuilder: (context, index) => Consumer<MyThemeProvider>(
            builder: (context, provider, child) => MyDivider(
              color: provider.mode == ThemeMode.light
                  ? Theme.of(context).primaryColor
                  : MyTheme.goldColor,
              thickness: 3,
            ),
          ),
          itemBuilder: (context, index) => ClickHadesName(
            text: provider.titles[index],
            index: index,
          ),
          itemCount: provider.titles.length,
        ),
      ),
    );
  }
}
