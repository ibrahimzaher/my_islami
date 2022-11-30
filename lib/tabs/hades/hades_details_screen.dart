import 'package:flutter/material.dart';
import 'package:my_islami/provider/my_hades_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/tabs/hades/hades_content.dart';
import 'package:provider/provider.dart';

class HadesDetailsScreen extends StatelessWidget {
  const HadesDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = 'hades-details-screen';
  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)?.settings.arguments as int;
    return Stack(
      children: [
        Consumer<MyThemeProvider>(
          builder: (context, provider, child) => Image.asset(
            (provider.mode == ThemeMode.light
                ? 'assets/images/bg.png'
                : 'assets/images/bg_dark.png'),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              context.read<MyHadesProvider>().titles[args],
              style: Theme.of(context).primaryTextTheme.subtitle2,
            ),
          ),
          body: Consumer<MyHadesProvider>(
            builder: (context, provider, child) => (provider.titles.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 8,
                        child: HadesContent(contanct: args),
                      ),
                      const Spacer(),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
