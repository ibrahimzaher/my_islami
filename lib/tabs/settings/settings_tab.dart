import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_language_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/tabs/settings/language_bottom_sheet.dart';
import 'package:my_islami/tabs/settings/theming_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            AppLocalizations.of(context)?.language ?? '',
            style: Theme.of(context).primaryTextTheme.subtitle2,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
              top: 10,
            ),
            padding: const EdgeInsetsDirectional.all(
              15,
            ),
            decoration: BoxDecoration(
              color: context.read<MyThemeProvider>().mode == ThemeMode.light
                  ? Theme.of(context).primaryColor
                  : MyTheme.goldColor,
              borderRadius: BorderRadiusDirectional.circular(
                20,
              ),
            ),
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.read<MyLanguageProvider>().language == 'ar'
                        ? AppLocalizations.of(context)?.arabic ?? ''
                        : AppLocalizations.of(context)?.english ?? '',
                    style:
                        Theme.of(context).primaryTextTheme.subtitle2?.copyWith(
                              fontSize: 18,
                              color: MyTheme.blackColor,
                            ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyTheme.blackColor,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Text(
            AppLocalizations.of(context)?.theming ?? '',
            style: Theme.of(context).primaryTextTheme.subtitle2,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
              top: 10,
            ),
            padding: const EdgeInsetsDirectional.all(
              15,
            ),
            decoration: BoxDecoration(
              color: context.read<MyThemeProvider>().mode == ThemeMode.light
                  ? Theme.of(context).primaryColor
                  : MyTheme.goldColor,
              borderRadius: BorderRadiusDirectional.circular(
                20,
              ),
            ),
            child: InkWell(
              onTap: () {
                showThemingBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.read<MyThemeProvider>().mode == ThemeMode.light
                        ? AppLocalizations.of(context)?.light ?? ''
                        : AppLocalizations.of(context)?.dark ?? '',
                    style:
                        Theme.of(context).primaryTextTheme.subtitle2?.copyWith(
                              fontSize: 18,
                              color: MyTheme.blackColor,
                            ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyTheme.blackColor,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 7,
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void showThemingBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemingBottomSheet(),
    );
  }
}
