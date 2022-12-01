import 'package:flutter/material.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          'assets/images/radio_image.png',
        ),
        const Spacer(),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).primaryTextTheme.subtitle2,
        ),
        const Spacer(),
        Consumer<MyThemeProvider>(
          builder: (context, provider, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  const AssetImage(
                    'assets/icons/prefix_icon.png',
                  ),
                  color: provider.mode == ThemeMode.light
                      ? Theme.of(context).primaryColor
                      : MyTheme.goldColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  const AssetImage(
                    'assets/icons/icon_play.png',
                  ),
                  color: provider.mode == ThemeMode.light
                      ? Theme.of(context).primaryColor
                      : MyTheme.goldColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  const AssetImage(
                    'assets/icons/suffix_icon.png',
                  ),
                  color: provider.mode == ThemeMode.light
                      ? Theme.of(context).primaryColor
                      : MyTheme.goldColor,
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
