import 'package:flutter/material.dart';
import 'package:ikinokat/pages/home/provider/home_provider.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/grid_products.dart';
import 'components/swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Scaffold(
        appBar: MyAppBar(
          backgroundColor: Theme.of(context).canvasColor,
          leadingType: AppBarBackType.None,
        ),
        body: HomePageContainer(),
      ),
    );
  }
}

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = Provider.of<HomeProvider>(context);
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
                  onLoading: state.loadData,
                  onRefresh: () => state.initData(refresh: true),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      // sliders
                      SliverToBoxAdapter(
                        child: HeadSwiper(
                          bannerList: state.sliders,
                        ),
                      ),

                      // vip products
                      SliverToBoxAdapter(
                        child: GridProducts(
                          label: 'vip_products',
                          products: state.vipProducts,
                        ),
                      ),

                      // trand products
                      SliverToBoxAdapter(
                        child: GridProducts(
                          label: 'trand_products',
                          products: state.trandProducts,
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: GridProducts(
                          label: 'all_products',
                          products: state.allProducts,
                        ),
                      ),

                      /// all products by scrolling up
                    ],
                    // +
                    // _hotCommodity(state.hotList),
                  ),
                ),
              ),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
