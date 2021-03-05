import 'package:flutter/material.dart';
import 'package:ikinokat/config/custom_color.dart';

class MyLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: CustomColors.appBarColor,
      ),
    );
  }
}
