import 'package:flutter/material.dart';
import 'package:my_islami/component/my_divider.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_hades_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:provider/provider.dart';

class HadesContent extends StatelessWidget {
  const HadesContent({Key? key, required this.contanct}) : super(key: key);
  final int contanct;
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
          itemCount: context.read<MyHadesProvider>().contents[contanct].length,
          itemBuilder: (context, index) => Text(
            context.read<MyHadesProvider>().contents[contanct][index],
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
