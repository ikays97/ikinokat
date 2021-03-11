import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;

  const MyTextFormField({
    Key key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: 'Montserrat-Regular'),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
