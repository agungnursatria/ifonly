part of '../main.dart';

class MultipleTextfieldSection extends StatefulWidget {
  final scaffoldContext;
  MultipleTextfieldSection({this.scaffoldContext});

  @override
  _MultipleTextfieldSectionState createState() =>
      _MultipleTextfieldSectionState();
}

class _MultipleTextfieldSectionState extends State<MultipleTextfieldSection> {
  bool isValidUsername;
  bool isValidEmail;
  bool isValidPassword;
  bool isValidAge;
  bool isValidPhone;
  bool isValidAddress;

  void onTapValidButton() => Scaffold.of(widget.scaffoldContext)
      .showSnackBar(SnackBar(content: Text('Yey!! amazing! :)')));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Example 2 - Multiple item if'),

        /// TextFormField - Username
        TextFormField(
          onChanged: (value) => setState(() {
            isValidUsername = value.ifNotNullOrBlank(
              () => RegexValidation.hasMatch(value, RegexPattern.username),
            );
          }),
          decoration: InputDecoration(
            hintText: 'Enter your username here...',
            errorText: isValidUsername.ifFalse(() => 'Invalid username'),
          ),
        ),
        SizedBox(height: 8.0),

        /// TextFormField - Email
        TextFormField(
          onChanged: (value) => setState(() {
            isValidEmail = value.ifNotNullOrBlank(
              () => RegexValidation.hasMatch(value, RegexPattern.email),
            );
          }),
          decoration: InputDecoration(
            hintText: 'Enter your email here...',
            errorText: isValidEmail.ifFalse(() => 'Invalid email'),
          ),
        ),
        SizedBox(height: 8.0),

        /// TextFormField - Password
        TextFormField(
          onChanged: (value) => setState(() {
            isValidPassword = value.ifNotNullOrBlank(
              () => RegexValidation.hasMatch(value, RegexPattern.passwordEasy),
            );
          }),
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter your password here...',
            errorText: isValidPassword.ifFalse(() => 'Invalid password'),
          ),
        ),
        SizedBox(height: 8.0),

        /// TextFormField - Age
        TextFormField(
          onChanged: (value) => setState(() {
            isValidAge = value.ifNotNullOrBlank(
              () => RegexValidation.hasMatch(value, RegexPattern.numericOnly),
            );
          }),
          decoration: InputDecoration(
            hintText: 'Enter your age here...',
            errorText: isValidAge.ifFalse(() => 'Invalid age'),
          ),
        ),
        SizedBox(height: 8.0),

        /// TextFormField - Phone Number
        TextFormField(
          onChanged: (value) => setState(() {
            isValidPhone = value.ifNotNullOrBlank(
              () => RegexValidation.hasMatch(value, RegexPattern.phone),
            );
          }),
          decoration: InputDecoration(
            hintText: 'Enter your phone number here...',
            errorText: isValidPhone.ifFalse(() => 'Invalid phone number'),
          ),
        ),
        SizedBox(height: 8.0),

        /// TextFormField - Address
        TextFormField(
          onChanged: (value) => setState(() {
            isValidAddress = value.ifNotNullOrBlank(() => true);
          }),
          decoration: InputDecoration(
            hintText: 'Enter your address here...',
            errorText: isValidAddress.ifFalse(() => 'Invalid address'),
          ),
        ),
        SizedBox(height: 20.0),

        /// Button
        IfOnly(
          condition: [
            isValidUsername,
            isValidEmail,
            isValidPassword,
            isValidAge,
            isValidPhone,
            isValidAddress,
          ].isTrue(),
          validBuilder: (context) => ValidButton(onClick: onTapValidButton),
          invalidBuilder: (context) => InvalidButton(),
        ),
      ],
    );
  }
}
