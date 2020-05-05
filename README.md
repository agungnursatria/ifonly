# IfOnly

Flutter conditional (`if`-`else` / `switch`-`case`) helpers to make a more readable and simplifier conditional code.

## 🏃‍♂️ Getting Started

In your flutter project add the dependency:

```yml
dependencies:
  ...
  ifonly: ^0.1.2
```

## 🧞‍♂️ Usage
#### Importing package
```dart
import 'package:ifonly/ifonly.dart';
```

## 🐋 Why using this?

Have you ever seen a repetitive code like this?

```dart
bool isValid = (username != null && username.isNotEmpty && password != null && password.isNotEmpty && email != null && email.isNotEmpty && phoneNumber != null && phoneNumber.isNotEmpty);
```

or returning widget like this

```dart
return (isValid) ? RaisedButton(child: Text('Click Me!'), onPressed: () => print('Hi!');) : RaisedButton(child: Text('Please fill the empty field first!'), onPressed: null;
```

## 🧙‍♂️ What IfOnly do

With this package, we are trying to make a commonly used code easier to read.

Like making the isValid to this:

```dart
bool isValid = [username, password, email, phoneNumber].isNotNullOrEmpties();
```

And returning widget to this:

```dart
return IfOnly(
    condition: isValid,
    validBuilder: (context) => RaisedButton(child: Text('Click Me!'), onPressed: () => print('Hi!');),
    invalidBuilder: (context) => RaisedButton(child: Text('Please fill the empty field first!'),
),
```

Or like this:

```dart
return IfCaseOnly<bool>(
    value: isValid,
    caseBuilder: {
        true: (BuildContext context) => RaisedButton(child: Text('Click Me!'), onPressed: () => print('Hi!');),
        false: (BuildContext context) => RaisedButton(child: Text('Please fill the empty field first!'),
    },
    defaultBuilder: (context) => Text("Expression's builder is undefined. please input it to caseBuilder."),
),
```
Or even like this:

```dart
return IfCaseOnly<IfCases>(
    value: IfCases(
        cases: [
            IfCaseItem(isValid.isTrue(), (context) => YourValidButton()),
            IfCaseItem(isValid.isFalse(), (context) => YourInvalidButton()),
        ],
    ),
    defaultBuilder: (context) => Text("Expression's builder is undefined. please input it to caseBuilder."),
),
```

### 👨‍🎨 Custom conditional function

If you need a self defined function like when define isValid, 
Use method `isCondition` or `ifCondition` for single data, `isConditions` or `ifConditions` for list:

```dart
bool isValid = [username, password, email, phoneNumber].isConditions((item) => item.isNotNullOrEmpty());
```

### Execute code after conditions are meet

Change the `is` on function to `if`

```dart
Widget nextButton;
[username, password, email, phoneNumber].ifConditions(
    (item) => item.isNotNullOrEmpty(),
    onTrue: (context) => nextButton = RaisedButton(child: Text('Click Me!'), onPressed: () => print('Hi!');),
    onFalse: (context) => nextButton = RaisedButton(child: Text('Please fill the empty field first!'),
);
```

### More detailed explanation

We have inputting comment to all function code, Go check [Repository](https://github.com/agungnursatria/ifonly/tree/master/lib) for more.

## 🙏🏻  Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/agungnursatria/ifonly/issues).
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/agungnursatria/ifonly/pulls).