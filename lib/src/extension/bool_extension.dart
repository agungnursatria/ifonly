import 'package:flutter/material.dart';

extension BoolExtension on bool {
  // Return true if the boolean value is true
  bool isTrue() => this == true;

  // Return false if the boolean value is not true
  bool isFalse() => this != true;

  /// Execute parameter by value condition.
  dynamic ifCondition({
    @required dynamic Function() onTrue,
    @required dynamic Function() onFalse,
  }) {
    return (this == true) ? ifTrue(onTrue) : ifFalse(onFalse);
  }

  /// Return onTrue if value is true.
  dynamic ifTrue(dynamic Function() onTrue) {
    return (this == true && onTrue != null) ? onTrue() : null;
  }

  /// Return onFalse if value is false or null.
  dynamic ifFalse(dynamic Function() onFalse) {
    return (this == false && onFalse != null) ? onFalse() : null;
  }
}
