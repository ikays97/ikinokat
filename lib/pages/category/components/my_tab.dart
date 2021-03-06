import 'package:flutter/material.dart';
import 'package:ikinokat/models/category.dart';

class MyTab extends StatefulWidget {
  final List<CategoryModel> items;

  const MyTab({Key key, this.items}) : super(key: key);
  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: widget.items.map((item) {
            return ExpansionTile(
              title: Text(item.name_tm),
              children: [
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('data'),
                    )
                  ],
                ),
                ListTile(
                  title: Text('data'),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
