import 'package:ifonly/ifonly.dart';

extension ListExtension on List {
  /// Check whether all child fullfiling condition.
  bool isCondition(bool Function(Object) condition) {
    if (this.isNullOrEmpty())
      throw FormatException('List cannot be null or empty');
    for (var item in this) if (condition(item) != true) return false;
    return true;
  }

  /// Execute onTrue if all child fullfiling condition.
  dynamic ifCondition(
    bool Function(dynamic) condition,
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isCondition(condition).ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Check whether all child is true.
  bool isTrue() {
    if (this.isNullOrEmpty()) return false;
    for (var item in this) {
      if (item != null && item is! bool)
        throw FormatException('Only accepting boolean value');
      if (item != true) return false;
    }
    return true;
  }

  /// Execute onTrue if all child is true.
  bool ifTrue(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isTrue().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Check whether all child is not true.
  bool isFalse() {
    if (this.isNullOrEmpty()) return false;
    for (var item in this) {
      if (item != null && item is! bool)
        throw FormatException('Only accepting boolean value');
      if (item == true) return false;
    }
    return true;
  }

  /// Execute onTrue if all child is false.
  bool ifFalse(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isFalse().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Checks whether all child is null or empty.
  bool isNullOrEmpties() {
    if (this.isNullOrEmpty()) return true;
    for (var item in this) if (!(item as Object).isNullOrEmpty()) return false;
    return true;
  }

  /// Checks whether all child is null or empty.
  bool isNotNullOrEmpties() => !isNullOrEmpties();

  /// Execute onTrue if value is null or empty.
  dynamic ifNullOrEmpties(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNullOrEmpties().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if value is Not null or empty.
  dynamic ifNotNullOrEmpties(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNotNullOrEmpties().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Checks whether all child is null or blank (empty or whitespace only (for string)).
  bool isNullOrBlanks() {
    if (this.isNullOrEmpty()) return true;
    for (var item in this) if (!(item as Object).isNullOrBlank()) return false;
    return true;
  }

  /// Checks whether all child is not null or blank (empty or whitespace only (for string)).
  bool isNotNullOrBlanks() {
    if (this.isNullOrEmpty()) return false;
    for (var item in this)
      if (!(item as Object).isNotNullOrBlank()) return false;
    return true;
  }

  /// Execute onTrue if all child value is null or Blank (empty or only contains whitespace).
  dynamic ifNullOrBlanks(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNullOrBlank().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if all child value is Not null or Blank (empty or only contains whitespace).
  dynamic ifNotNullOrBlanks(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNotNullOrBlank().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );
}
