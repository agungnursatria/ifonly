import 'package:flutter/material.dart';

class IfCases {
  final List<IfCaseItem> cases;
  IfCases({this.cases = const []});
}

class IfCaseItem {
  final bool expression;
  final Widget Function(BuildContext context) builder;
  IfCaseItem(this.expression, this.builder);
}
