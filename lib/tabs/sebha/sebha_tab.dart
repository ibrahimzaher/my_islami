import 'package:flutter/material.dart';
import 'package:my_islami/my_theme.dart';
import 'package:my_islami/provider/my_sebha_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: 8,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Consumer<MySebhaProvider>(
                builder: (context, provider, child) => Transform.rotate(
                  angle: provider.angle,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      provider.changeCounter();
                    },
                    child: Consumer<MyThemeProvider>(
                      builder: (context, provider, child) => Image.asset(
                        'assets/images/sebha_image.png',
                        color: provider.mode == ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : MyTheme.goldColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: -75,
                child: Consumer<MyThemeProvider>(
                  builder: (context, provider, child) => Image.asset(
                    'assets/images/sebha_head_image.png',
                    color: provider.mode == ThemeMode.light
                        ? Theme.of(context).primaryColor
                        : MyTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).primaryTextTheme.subtitle2,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsetsDirectional.all(
              20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Consumer<MySebhaProvider>(
              builder: (context, provider, child) => Text(
                provider.counter.toString(),
                style: Theme.of(context).primaryTextTheme.subtitle2,
              ),
            ),
          ),
          const Spacer(),
          Consumer<MyThemeProvider>(
            builder: (context, provider, child) => Container(
              padding: const EdgeInsetsDirectional.all(
                10,
              ),
              decoration: BoxDecoration(
                color: provider.mode == ThemeMode.light
                    ? Theme.of(context).primaryColor
                    : MyTheme.goldColor,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Consumer<MySebhaProvider>(
                builder: (context, pp, child) => Text(
                  pp.values[pp.index],
                  style: provider.mode == ThemeMode.light
                      ? Theme.of(context)
                          .primaryTextTheme
                          .subtitle2
                          ?.copyWith(color: Colors.white)
                      : Theme.of(context)
                          .primaryTextTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
