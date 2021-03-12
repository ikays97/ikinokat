import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikinokat/models/product.dart';
import 'package:ikinokat/pages/detail/detail.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/my_cached_image.dart';

class GridProducts extends StatelessWidget {
  final String label;
  final List<ProductItemModel> products;
  const GridProducts({Key key, @required this.products, this.label})
      : super(key: key);

  //
  List<Widget> _buildGridItem(BuildContext context) {
    final String code = Get.locale.languageCode;
    final _screenWidth = MediaQuery.of(context).size.width;
    List<Widget> gridItemList = [];
    for (int i = 0; i < products.length; i++) {
      gridItemList.add(
        InkWell(
          onTap: () {
            MyNavigator.push(
              ProductDetailPage(
                id: products[i].id,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: _screenWidth * 0.3,
                  width: _screenWidth * 0.3,
                  padding: EdgeInsets.only(bottom: 12),
                  child: MyCachedNetworkImage(
                    imageurl: products[i].picurl,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(
                    // products[i].getName(code),
                    products[i].getName(code),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ),
                if (products[i].price != null)
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      // products[i].getName(code),
                      products[i].price,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.redAccent),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return gridItemList;
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    // final _containerHeight = _screenWidth <= 414 ? 228.0 : 108.0;
    final _crossAxisCount = 3;
    final _childAspectRatio = _screenWidth / _crossAxisCount / 195;
    return Container(
      // height: _containerHeight,
      width: _screenWidth - 20,
      // padding: EdgeInsets.all(15),
      // margin: EdgeInsets.only(top: 15, right: 15, bottom: 7.5, left: 15),
      child: Column(
        children: [
          if (label != null) _buildLabel(context, label),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: _crossAxisCount,
            childAspectRatio: _childAspectRatio,
            children: _buildGridItem(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String title) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenWidth * 0.12,
      child: Text(
        label.tr,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
