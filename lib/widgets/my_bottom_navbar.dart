import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ikinokat/config/custom_color.dart';
import 'package:ikinokat/pages/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

const List<Map<String, String>> _tabBarData = [
  {
    "title": "Home",
    "image": "assets/icons/home.svg",
    "selectedImage": "assets/icons/home.svg",
  },
  {
    "title": "Category",
    "image": "assets/icons/category.svg",
    "selectedImage": "assets/icons/category.svg",
  },
  {
    "title": "Add Product",
    "image": "assets/icons/add.svg",
    "selectedImage": "assets/icons/add.svg",
  },
  {
    "title": "Profile",
    "image": "assets/icons/person.svg",
    "selectedImage": "assets/icons/person.svg",
  },
];

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  const MyBottomNavigationBar({this.onTap});

  @override
  Widget build(BuildContext context) {
    final bottomHeight = 49 +
        MediaQuery.of(context).padding.bottom +
        (Platform.isAndroid ? 2 : 0);
    return SizedBox(
      height: bottomHeight,
      child: _getBottomNavigationBar(context),
    );
  }

  _getBottomNavigationBar(BuildContext context) {
    return Stack(
      children: [
        Selector<MainProvider, int>(
          builder: (_, index, __) {
            return BottomNavigationBar(
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              unselectedItemColor: CustomColors.unselectedItemColor,
              selectedItemColor: CustomColors.selectedItemColor,
              backgroundColor: CustomColors.backgroundColor,
              elevation: 0,
              onTap: this.onTap,
              items: _getTabBar(context),
            );
          },
          selector: (_, model) => model.getTabBarSelectedIndex,
        ),
        Divider(
          height: 0.5,
          color: CustomColors.dividerColor,
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> _getTabBar(BuildContext context) {
    return _tabBarData.map((item) {
      return _getBottomBarItem(
          item['title'], item['image'], item['selectedImage'], context);
    }).toList();
  }

  BottomNavigationBarItem _getBottomBarItem(
      String title, String image, String selectedImage, BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _tabBarIconWidth = _screenWidth / _tabBarData.length;
    const _tabBarIconHeight = 22.0;

    return BottomNavigationBarItem(
      icon: Container(
        child: Stack(
          children: [
            SvgPicture.asset(
              image,
              width: _tabBarIconWidth,
              height: _tabBarIconHeight,
            ),
          ],
        ),
      ),
      activeIcon: Stack(
        children: [
          SvgPicture.asset(
            selectedImage,
            width: _tabBarIconWidth,
            height: _tabBarIconHeight,
          ),
        ],
      ),
      label: title,
    );
  }
}
