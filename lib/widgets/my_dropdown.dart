import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  final String currentSelected;
  final List<String> list;
  final Function(String value) onChanged;
  final String hintText;
  final String labelText;

  const MyDropDown({
    Key key,
    @required this.list,
    @required this.onChanged,
    @required this.currentSelected,
    @required this.hintText,
    @required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 10, 0),
              labelStyle: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.7),
              ),
              hintStyle: TextStyle(
                fontSize: 13,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.4),
              ),
              errorStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 12.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(hintText),
                value: currentSelected,
                isExpanded: true,
                onChanged: onChanged,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
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
