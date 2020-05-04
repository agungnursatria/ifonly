import 'package:flutter/material.dart';

class CaseOnly<T> extends StatelessWidget {
  final T value;
  final Map<T, Widget Function(BuildContext context)> caseBuilder;
  final Widget Function(BuildContext) defaultBuilder;

  CaseOnly({
    Key key,
    @required this.value,
    @required this.caseBuilder,
    @required this.defaultBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return caseBuilder[value](context) ?? defaultBuilder(context);
  }
}
