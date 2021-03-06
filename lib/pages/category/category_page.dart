import 'package:flutter/material.dart';
import 'package:ikinokat/config/custom_color.dart';
import 'package:ikinokat/pages/category/provider/category_provider.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:provider/provider.dart';

import 'components/my_tab.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyAppBar(
            leadingType: AppBarBackType.None,
            bottom: TabBar(
              indicatorColor: Color(0xFFD1C3BC),
              tabs: [
                Tab(
                  text: 'Category',
                ),
                Tab(
                  text: 'Markets',
                ),
              ],
            ),
          ),
          body: CategoryPageContainer(),
        ),
      ),
    );
  }
}

class CategoryPageContainer extends StatefulWidget {
  @override
  _CategoryPageContainerState createState() => _CategoryPageContainerState();
}

class _CategoryPageContainerState extends State<CategoryPageContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = Provider.of<CategoryProvider>(context, listen: false);

    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: CustomColors.backgroundColor,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: TabBarView(
                children: [
                  MyTab(items: state.categories),
                  MyTab(items: state.categories),
                ],
              ),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
