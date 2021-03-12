import 'package:flutter/material.dart';
import 'package:ikinokat/pages/category/provider/category_provider.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:provider/provider.dart';

class CategoryPageContainer extends StatefulWidget {
  @override
  _CategoryPageContainerState createState() => _CategoryPageContainerState();
}

class _CategoryPageContainerState extends State<CategoryPageContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = Provider.of<CategoryProvider>(context);

    return state.loading
        ? MyLoadingWidget()
        : Container(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SingleChildScrollView(
                child: Column(
                  children: state.categories.map((item) {
                    return Card(
                      child: ListTile(
                        title: Text(item.name_tm),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
