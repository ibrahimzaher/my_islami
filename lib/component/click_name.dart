import 'package:flutter/material.dart';

class ClickName extends StatelessWidget {
  const ClickName({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.subtitle2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
