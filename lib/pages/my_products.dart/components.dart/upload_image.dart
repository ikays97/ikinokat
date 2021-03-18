import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.24,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: onTap,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/cloud.png',
                  height: 20,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/add.svg',
                    height: 15,
                  ),
                  SizedBox(width: 10),
                  Text('Add product pictures'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
