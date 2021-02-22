import 'package:flutter/material.dart';

class JContent extends StatelessWidget {
  final String text;

  const JContent({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}