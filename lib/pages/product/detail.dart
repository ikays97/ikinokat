import 'package:flutter/material.dart';
import 'package:ikinokat/pages/product/provider/product_provider.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:provider/provider.dart';

import 'component/images_swiper.dart';

class ProductDetailPage extends StatelessWidget {
  final int id;
  const ProductDetailPage({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailProvider(productId: id),
      child: Scaffold(
        appBar: MyAppBar(
          leadingType: AppBarBackType.Back,
          title: Text('Product Detail'),
        ),
        body: SafeArea(
          child: ProductDetailPageContainer(),
        ),
      ),
    );
  }
}

class ProductDetailPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProductDetailProvider>(context);
    return state.loading
        ? MyLoadingWidget()
        : Container(
            child: ListView(
            children: [
              ImagesSwiper(imagesList: state.productDetail.images),
              Text(state.productDetail.name_tm.toString()),
            ],
          ));
  }
}
