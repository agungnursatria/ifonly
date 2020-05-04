import 'package:flutter/material.dart';

class ValidButton extends StatelessWidget {
  final VoidCallback onClick;
  ValidButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.thumb_up,
            color: Theme.of(context).primaryColorDark,
          ),
          SizedBox(width: 8.0),
          Text(
            'Click me!',
            style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
        ],
      ),
      onPressed: onClick,
    );
  }
}
