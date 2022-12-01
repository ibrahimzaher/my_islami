import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:provider/provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyThemeProvider>(context);
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      margin: const EdgeInsetsDirectional.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: provider.mode == ThemeMode.light
                ? getSelectedItem(context, AppLocalizations.of(context)?.light)
                : getUnSelectedItem(
                    context, AppLocalizations.of(context)?.light),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: provider.mode == ThemeMode.dark
                ? getSelectedItem(context, AppLocalizations.of(context)?.dark)
                : getUnSelectedItem(
                    context, AppLocalizations.of(context)?.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(context, text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .primaryTextTheme
              .headline5
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItem(context, text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).primaryTextTheme.headline5?.copyWith(
                color: MyTheme.blackColor,
              ),
        ),
      ],
    );
  }
}
