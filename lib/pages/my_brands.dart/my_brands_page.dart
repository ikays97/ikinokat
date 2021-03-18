import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikinokat/pages/my_brands.dart/components/grid_brands.dart';
import 'package:ikinokat/pages/my_brands.dart/provider/getbrands_provider.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_custom_footer.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyBrandsPage extends StatelessWidget {
  const MyBrandsPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        leadingType: AppBarBackType.Back,
        title: Text('My Brands'),
      ),
      body: SafeArea(
        child: MyBrandsPageContainer(),
      ),
    );
  }
}

class MyBrandsPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<GetBrandsProvider>(context);
    return state.loading
        ? MyLoadingWidget()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: SmartRefresher(
                  controller: state.refreshController,
                  enablePullUp: true,
                  onRefresh: state.getUserBrands,
                  onLoading: state.loadMoreProducts,
                  footer: MyCustomFooter(),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: GridBrands(
                          brands: state.userBrands,
                        ),
                      ),

                      /// all brands by scrolling up
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
