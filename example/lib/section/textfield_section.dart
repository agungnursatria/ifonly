part of '../main.dart';

class TextfieldSection extends StatefulWidget {
  final scaffoldContext;
  TextfieldSection({this.scaffoldContext});

  @override
  TextfieldSectionState createState() => TextfieldSectionState();
}

class TextfieldSectionState extends State<TextfieldSection> {
  TextEditingController _controller;
  bool isValid;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  void onTapValidButton() => Scaffold.of(widget.scaffoldContext)
      .showSnackBar(SnackBar(content: Text('Wow!! amazing email! :)')));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Example 1 - Single item if'),
        TextFormField(
          controller: _controller,
          onChanged: (value) {
            setState(
              () {
                isValid = value.ifNotNullOrBlank(
                  () => RegexValidation.hasMatch(
                    value,
                    RegexPattern.email,
                  ),
                );
              },
            );
          },
          decoration: InputDecoration(
            hintText: 'Enter your email here...',
            errorText: isValid.ifFalse(() => 'Invalid email'),
          ),
        ),
        SizedBox(height: 20.0),
        IfOnly(
          condition: isValid.isTrue(),
          validBuilder: (context) => ValidButton(onClick: onTapValidButton),
          invalidBuilder: (context) => InvalidButton(),
        ),
      ],
    );
  }
}
