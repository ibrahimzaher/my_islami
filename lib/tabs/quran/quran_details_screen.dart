import 'package:flutter/material.dart';
import 'package:my_islami/provider/my_quran_tab_provider.dart';
import 'package:my_islami/provider/my_theme_provider.dart';
import 'package:my_islami/tabs/quran/my_quran_model.dart';
import 'package:my_islami/tabs/quran/quran_content.dart';
import 'package:provider/provider.dart';

class QuranDetailsScreen extends StatelessWidget {
  const QuranDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = 'quran-details-screen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MyQuranModel;
    context.read<MyQuranTabProvider>().readFiles(args.index);
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
              args.text,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          body: Consumer<MyQuranTabProvider>(
            builder: (context, provider, child) => (provider.content.isEmpty)
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
                        child: QuranContent(
                          content: provider.content,
                        ),
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
