import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:ikinokat/config/custom_color.dart';
import 'package:ikinokat/pages/home/home_page.dart';
import 'package:ikinokat/pages/main/provider/main_provider.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_bottom_navbar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 750), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mainState = Provider.of<MainProvider>(context, listen: false);
    MyNavigator.ctx = context;
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: MyAppBar(
        leadingType: AppBarBackType.None,
      ),
      backgroundColor: CustomColors.backgroundColor,
      bottomNavigationBar: MyBottomNavigationBar(
        onTap: (index) {
          mainState.tabBarPageController.jumpToPage(index);
          setState(() {
            mainState.setTabBarSelectedIndex = index;
          });
        },
      ),
      body: PageView(
        controller: mainState.tabBarPageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          TestPage1(),
          TestPage2(),
          TestPage3(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Page 1',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Page 2',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Page 3',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Page 4',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
