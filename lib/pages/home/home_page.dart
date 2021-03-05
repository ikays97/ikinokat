import 'package:flutter/material.dart';
import 'package:ikinokat/config/custom_color.dart';
import 'package:ikinokat/pages/home/provider/home_provider.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: HomePageContainer(),
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
    final state = Provider.of<HomeProvider>(context, listen: false);

    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: CustomColors.backgroundColor,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SmartRefresher(
                controller: state.refreshController,
                enablePullUp: true,
                onRefresh: () => state.initData(refresh: true),
                child: CustomScrollView(
                  slivers: <Widget>[
                    /// sliders
                    SliverToBoxAdapter(
                      child: HeadSwiper(
                        bannerList: state.sliders,
                      ),
                    ),

                    /// vip products
                    // SliverToBoxAdapter(
                    //   child: CommodityCateGory(
                    //       cateGoryList: state.cateGoryList),
                    // ),

                    // /// trand products
                    // SliverToBoxAdapter(
                    //   child: BrandSwiper(brandList: state.brandList),
                    // ),

                    /// all products by scrolling up
                  ],
                  // +
                  // _hotCommodity(state.hotList),
                ),
              ),
            ),
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
