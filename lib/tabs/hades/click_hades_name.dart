import 'package:flutter/material.dart';
import 'package:my_islami/tabs/hades/hades_details_screen.dart';

class ClickHadesName extends StatelessWidget {
  const ClickHadesName({Key? key, required this.text, required this.index})
      : super(key: key);
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadesDetailsScreen.routeName,
          arguments: index,
        );
      },
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.subtitle2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
