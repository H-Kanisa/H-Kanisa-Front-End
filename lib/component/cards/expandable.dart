import 'package:flutter/material.dart';

class Expandable extends StatefulWidget {
  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _expanded,
                  onChanged: (value) {
                    setState(() {
                      _expanded = value;
                    });
                  },
                ),
                Checkbox(
                  value: !_expanded,
                  onChanged: (value) {
                    setState(() {
                      _expanded = !value;
                    });
                  },
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Expanded Content',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
        ],
      ),
    );
  }
}
