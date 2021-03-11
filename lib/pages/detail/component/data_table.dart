import 'package:flutter/material.dart';
import 'package:ikinokat/models/detail.dart';
import 'package:get/get.dart';

class DetailDataTable extends StatelessWidget {
  final DetailItemModel product;

  const DetailDataTable({Key key, this.product}) : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Theme.of(context).cardColor),
        ListTile(
          dense: true,
          leading: Icon(Icons.person),
          title: Text(
            'productd_preview'.tr,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing: Text(
            '${product.preview}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Divider(),
        ListTile(
          dense: true,
          leading: Icon(Icons.money),
          title: Text(
            'productd_price'.tr,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          trailing: Text(
            '${product.price}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Divider(),
        if (product.min_qua != null)
          ListTile(
            dense: true,
            leading: Icon(Icons.confirmation_number),
            title: Text(
              'productd_min'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Text(
              '${product.min_qua}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ListTile(
          dense: true,
          leading: Icon(Icons.info),
          title: Text(
            'productd_desc'.tr,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
