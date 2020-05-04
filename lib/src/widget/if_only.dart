import 'package:flutter/material.dart';

class IfOnly extends StatelessWidget {
  final bool condition;
  final Widget Function(BuildContext) validBuilder;
  final Widget Function(BuildContext) invalidBuilder;

  IfOnly({
    Key key,
    @required this.condition,
    @required this.validBuilder,
    @required this.invalidBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition ? validBuilder(context) : invalidBuilder(context);
  }
}
