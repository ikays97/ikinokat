import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ikinokat/config/custom_color.dart';

/// appbar
enum AppBarBackType { Back, Close, None }

const double kNavigationBarHeight = 44.0;

// AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar(
      {Key key,
      Widget title,
      AppBarBackType leadingType,
      WillPopCallback onWillPop,
      Widget leading,
      Brightness brightness,
      Color backgroundColor,
      bool centerTitle = false,
      double elevation})
      : super(
          key: key,
          title: title ??
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  "assets/icons/amazon.png",
                  width: 95,
                ),
              ),
          centerTitle: centerTitle,
          brightness: brightness ?? Brightness.dark,
          backgroundColor: backgroundColor ?? CustomColors.appBarColor,
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? null
                  : AppBarBack(
                      leadingType ?? AppBarBackType.Back,
                      onWillPop: onWillPop,
                    )),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15, bottom: 5),
              height: 45,
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                color: Colors.white,
              ),
            ),
          ],
          elevation: elevation ?? 0.5,
        );
  @override
  get preferredSize => Size.fromHeight(44);
}

class AppBarBack extends StatelessWidget {
  final AppBarBackType _backType;
  final Color color;
  final WillPopCallback onWillPop;

  AppBarBack(this._backType, {this.onWillPop, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Container(
              child: Icon(Icons.close,
                  color: color ?? Color(0xFF222222), size: 24.0),
            )
          : Container(
              padding: EdgeInsets.only(right: 15),
              child: Image.asset(
                'assets/images/nav/nav_back.png',
                color: color,
              ),
            ),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String _title;

  MyTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
          color: Theme.of(context).textTheme.bodyText2.color,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }
}
