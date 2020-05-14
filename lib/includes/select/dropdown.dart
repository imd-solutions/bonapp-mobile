import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class Dropdown extends StatelessWidget {
  final int selected;
  final Function updateSelected;
  final dynamic data;

  Dropdown({this.selected, this.updateSelected, this.data});

  Widget _buildDropdown() {
    List<DropdownMenuItem<int>> items = [];

    void _changedDropDownItem(int selected) {
      updateSelected(selected);
    }

    // Initial select.
    items.add(
      new DropdownMenuItem(
        value: 0,
        child: Text(
          'Please Select',
          style: TextStyle(fontSize: 9.0),
        ),
      ),
    );

    // Additional select items.
    for (dynamic d in data) {
      items.add(
        new DropdownMenuItem(
          value: int.parse(d.info.id),
          child: new Text(
            d.info.name,
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
        color: Color(greyColour),
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        value: selected,
        items: items,
        onChanged: _changedDropDownItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildDropdown(),
          ],
        ),
      ),
    );
  }
}
