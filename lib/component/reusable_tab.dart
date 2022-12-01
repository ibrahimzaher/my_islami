import 'package:flutter/material.dart';
import 'package:my_islami/component/my_divider.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:provider/provider.dart';

class ReusableTab extends StatelessWidget {
  const ReusableTab(
      {Key? key,
      required this.image,
      required this.widget,
      required this.title})
      : super(key: key);
  final String image;
  final Widget widget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            image,
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
          title,
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
          child: widget,
        ),
      ],
    );
  }
}
