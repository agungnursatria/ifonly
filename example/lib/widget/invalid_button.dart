import 'package:flutter/material.dart';

class InvalidButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.thumb_down),
          SizedBox(width: 8.0),
          Text('Enter the empty field first!'),
        ],
      ),
      onPressed: null,
    );
  }
}
