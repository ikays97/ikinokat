import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const MyCustomButton({
    Key key,
    @required this.onTap,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).backgroundColor,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            text.toLowerCase(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
