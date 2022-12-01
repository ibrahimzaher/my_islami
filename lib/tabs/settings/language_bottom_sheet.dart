import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_language_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyLanguageProvider>(context);
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      margin: const EdgeInsetsDirectional.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: provider.language == 'en'
                ? getSelectedItem(
                    context, AppLocalizations.of(context)?.english)
                : getUnSelectedItem(
                    context, AppLocalizations.of(context)?.english),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: provider.language == 'ar'
                ? getSelectedItem(context, AppLocalizations.of(context)?.arabic)
                : getUnSelectedItem(
                    context, AppLocalizations.of(context)?.arabic),
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
