import 'package:flutter/material.dart';
import 'package:my_islami/tabs/quran/my_quran_model.dart';
import 'package:my_islami/tabs/quran/quran_details_screen.dart';

class ClickSuraName extends StatelessWidget {
  const ClickSuraName({Key? key, required this.text, required this.index})
      : super(key: key);
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetailsScreen.routeName,
            arguments: MyQuranModel(text: text, index: index));
      },
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.subtitle2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
