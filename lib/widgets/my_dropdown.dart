import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  final BuildContext context;
  final List<String> list;
  final Function onChanged;
  final String selected;

  const MyDropDown({
    Key key,
    this.context,
    this.list,
    this.onChanged,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: MediaQuery.of(context).size.width * 0.8,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                // labelStyle: TextStyle(
                //   fontFamily: 'Montserrat-Regular',
                //   fontSize: 12,
                // ),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            // isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selected,
                // isDense: true,
                isExpanded: true,
                onChanged: onChanged,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
