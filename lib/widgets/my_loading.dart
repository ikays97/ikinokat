import 'package:flutter/material.dart';
import 'package:ikinokat/config/custom_theme.dart';

class MyLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Theme(
      data: Theme.of(context).copyWith(accentColor: CustomColors.appBarColor),
      child: CircularProgressIndicator(),
    ));
  }
}
