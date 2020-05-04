import 'package:ifonly/ifonly.dart';

extension ObjectExtension on Object {
  /// Check whether the value is null.
  bool isNull() => this == null || this.toString() == 'null';

  /// Checks whether the value is null or empty.
  bool isNullOrEmpty() {
    if (isNull()) return true;
    if (this is List) return (this as List).isEmpty;
    if (this is Map) return (this as Map).isEmpty;
    if (this is Set) return (this as Set).isEmpty;
    if (this is int || this is double || this is num)
      return this == 0 || this == 0.0;
    return this.toString().isEmpty;
  }

  /// Checks whether the value is null or blank (empty or whitespace only (for string)).
  bool isNullOrBlank() {
    if (isNull()) return true;
    if (this is List) return (this as List).isEmpty;
    if (this is Map) return (this as Map).isEmpty;
    if (this is Set) return (this as Set).isEmpty;
    if (this is int || this is double || this is num)
      return this == 0 || this == 0.0;
    return this.toString().trim().isEmpty;
  }

  /// Check whether the value is not null.
  bool isNotNull() => !isNull();

  /// Checks whether the value is Not null or empty.
  bool isNotNullOrEmpty() => !isNullOrEmpty();

  /// Checks whether the value is Not null or empty.
  bool isNotNullOrBlank() => !isNullOrBlank();

  /// Execute onTrue if value is null.
  dynamic ifNull(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNull().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if value is null or empty.
  dynamic ifNullOrEmpty(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNullOrEmpty().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if value is not null.
  dynamic ifNotNull(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNotNull().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if value is Not null or empty.
  dynamic ifNotNullOrEmpty(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNotNullOrEmpty().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if value is null or Blank (empty or only contains whitespace).
  dynamic ifNullOrBlank(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNullOrBlank().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );

  /// Execute onTrue if value is Not null or Blank (empty or only contains whitespace).
  dynamic ifNotNullOrBlank(
    dynamic Function() onTrue, {
    dynamic Function() onFalse,
  }) =>
      isNotNullOrBlank().ifCondition(
        onTrue: onTrue,
        onFalse: onFalse,
      );
}
