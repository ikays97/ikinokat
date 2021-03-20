import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikinokat/config/custom_theme.dart';
import 'package:ikinokat/pages/my_brands.dart/my_brands_page.dart';
import 'package:ikinokat/pages/my_orders.dart/my_orders_page.dart';
import 'package:ikinokat/pages/view_my_products/products_page.dart';
import 'package:ikinokat/pages/profile/components/select_language.dart';
import 'package:ikinokat/pages/profile/provider/theme_provider.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/label_section.dart';
import 'package:ikinokat/widgets/my_divider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'list_tile_item.dart';

class ProfileTileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.13, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          // personal
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: LeftTitle(
              title: 'personal'.tr,
            ),
          ),
          MyDivider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTileItem(
                  iconData: 'assets/icons/product.svg',
                  title: 'my_products'.tr,
                  count: 37,
                  onTap: () {
                    MyNavigator.push(MyProductsPage());
                  },
                ),
                ListTileItem(
                  iconData: 'assets/icons/star.svg',
                  title: 'my_brands'.tr,
                  count: 5,
                  onTap: () {
                    MyNavigator.push(MyBrandsPage());
                  },
                ),
                ListTileItem(
                  iconData: 'assets/icons/orders.svg',
                  title: 'my_request_me'.tr,
                  count: 15,
                  onTap: () {
                    MyNavigator.push(MyOrdersPage());
                  },
                ),
              ],
            ),
          ),
          MyDivider(),
          // settings
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: LeftTitle(
              title: 'settings'.tr,
            ),
          ),
          MyDivider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                    ListTileItem(
                      iconData: 'assets/icons/language.svg',
                      title: 'language'.tr,
                      count: 3,
                      onTap: () {
                        MyNavigator.push(LanguageSelectPage());
                      },
                    ),
                  ] +
                  [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 35.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wb_sunny_outlined,
                            size: 25,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'dark'.tr,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Theme.of(context).accentColor,
                                    ),
                          ),
                          Spacer(),
                          CupertinoSwitch(
                            value: themeNotifier.getTheme == darkTheme,
                            onChanged: (value) async {
                              (value)
                                  ? themeNotifier.setTheme(darkTheme)
                                  : themeNotifier.setTheme(lightTheme);
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool('darkMode', value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
