import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TranslationDemo extends StatefulWidget {
  @override
  _TranslationDemoState createState() => _TranslationDemoState();
}

class _TranslationDemoState extends State<TranslationDemo> {
  String dropdownValue = 'English - US';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Localization Demo"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "vip".tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ).tr(),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "trand".tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ).tr(),
                  )),
                ],
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "trand".tr() + ":",
                    style: TextStyle(fontSize: 15),
                  ).tr(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: width,
              alignment: Alignment.center,
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.black, width: .9),
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        DropdownButton<String>(
                          icon: Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            height: 30,
                            width: 30,
                          ),
                          iconSize: 18,
                          elevation: 16,
                          value: dropdownValue,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            color: Colors.transparent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              if (newValue == 'English - UK') {
                                this.setState(() {
                                  dropdownValue = 'English - UK';
                                  context.locale = Locale('en', 'UK');
                                });
                              } else if (newValue == 'Russian - RU') {
                                this.setState(() {
                                  dropdownValue = 'Russian - RU';
                                  context.locale = Locale('ru', 'RU');
                                });
                              } else if (newValue == 'Turkmen - TM') {
                                this.setState(() {
                                  dropdownValue = 'Turkmen - TM';
                                  context.locale = Locale('en', 'US');
                                });
                              }
                            });
                          },
                          items: <String>[
                            'English - UK',
                            'Russian - RU',
                            'Turkmen - TM',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 18,
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
