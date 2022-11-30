import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/my_divider.dart';
import '../../my_theme.dart';
import '../../provider/my_theme_provider.dart';

class QuranContent extends StatelessWidget {
  const QuranContent({Key? key, required this.content}) : super(key: key);
  final List<String> content;
  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
      builder: (context, provider, child) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        color: provider.mode == ThemeMode.light
            ? MyTheme.whiteColor
            : Theme.of(context).primaryColor,
        shadowColor: Colors.black,
        elevation: 20,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsetsDirectional.all(
            10,
          ),
          separatorBuilder: (context, index) => Consumer<MyThemeProvider>(
            builder: (context, provider, child) => MyDivider(
              color: provider.mode == ThemeMode.light
                  ? Theme.of(context).primaryColor
                  : MyTheme.goldColor,
              thickness: 2,
            ),
          ),
          itemCount: content.length,
          itemBuilder: (context, index) => Text(
            '${content[index]} (${index + 1})',
            style: provider.mode == ThemeMode.light
                ? Theme.of(context).primaryTextTheme.subtitle2
                : Theme.of(context)
                    .primaryTextTheme
                    .subtitle2!
                    .copyWith(color: MyTheme.goldColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
