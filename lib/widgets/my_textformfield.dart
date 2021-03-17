import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final bool obscureText;

  const MyTextFormField({
    Key key,
    @required this.controller,
    @required this.validator,
    this.hintText,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
  }) : super(key: key);

  checkPlatform(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        minLines: minLines,
        placeholder: hintText,
        padding: EdgeInsets.all(10),
        clearButtonMode: OverlayVisibilityMode.editing,
        inputFormatters: [
          LengthLimitingTextInputFormatter(35),
        ],
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 16,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          border: Border.all(color: Theme.of(context).accentColor),
        ),
      );
    } else if (Platform.isAndroid) {
      return TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        minLines: minLines,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 16,
            ),
        decoration: InputDecoration(
          hintText: hintText,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: checkPlatform(context),
    );
  }
}
