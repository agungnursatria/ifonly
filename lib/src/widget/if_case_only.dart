import 'package:flutter/material.dart';
import 'package:ifonly/src/model/if_case_model.dart';

class IfCaseOnly<T> extends StatelessWidget {
  final T value;
  final Map<T, Widget Function(BuildContext context)> caseBuilder;
  final Widget Function(BuildContext) defaultBuilder;

  IfCaseOnly({
    Key key,
    @required this.value,
    this.caseBuilder,
    @required this.defaultBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value is IfCases) {
      for (var item in (value as IfCases).cases)
        if (item.expression) return item.builder(context);
      return defaultBuilder(context);
    } else {
      return caseBuilder[value](context) ?? defaultBuilder(context);
    }
  }
}
