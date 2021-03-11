import 'package:flutter/material.dart';

class LabelSection extends StatelessWidget {
  const LabelSection({
    Key key,
    this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
