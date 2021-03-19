import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final bool obscureText;

  const MyTextFormField({
    Key key,
    @required this.controller,
    @required this.validator,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
  }) : super(key: key);

  platformIOS(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7.0,
      ),
      child: CupertinoTextField(
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
      ),
    );
  }

  platformAndroid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return TextFormField(
            controller: controller,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 16,
                ),
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 10, 0),
              labelStyle: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.7),
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                fontSize: 13,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.4),
              ),
              errorStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 12.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor.withOpacity(0.7),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            strutStyle: StrutStyle(
              fontSize: 25,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return platformIOS(context);
    } else if (Platform.isAndroid) {
      return platformAndroid(context);
    } else {
      return Container();
    }
  }
}
