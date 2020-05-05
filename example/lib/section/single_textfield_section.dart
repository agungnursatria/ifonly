part of '../main.dart';

class SingleTextfieldSection extends StatefulWidget {
  final scaffoldContext;
  SingleTextfieldSection({this.scaffoldContext});

  @override
  SingleTextfieldSectionState createState() => SingleTextfieldSectionState();
}

class SingleTextfieldSectionState extends State<SingleTextfieldSection> {
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

        /// IfWidget Example - IfOnly
        IfOnly(
          condition: isValid.isTrue(),
          validBuilder: (context) => ValidButton(onClick: onTapValidButton),
          invalidBuilder: (context) => InvalidButton(),
        ),
        SizedBox(height: 8.0),

        /// IfWidget Example - IfCaseOnly
        IfCaseOnly<bool>(
          value: isValid.isTrue(),
          caseBuilder: {
            true: (BuildContext context) => Text('IfCaseOnly - Valid!'),
            false: (BuildContext context) => Text('IfCaseOnly - Invalid!'),
          },
          defaultBuilder: (context) => Text('value of isValid is null!'),
        ),
        SizedBox(height: 8.0),

        /// IfWidget Example - IfCaseOnly (Value as IfCases)
        /// No need to make caseBuilder
        IfCaseOnly<IfCases>(
          value: IfCases(
            cases: [
              IfCaseItem(
                isValid.isTrue(),
                (context) => Text(
                  'IfCaseOnly (Value as IfCases) - Valid!',
                ),
              ),
              IfCaseItem(
                isValid.isFalse(),
                (context) => Text(
                  'IfCaseOnly (Value as IfCases) - Invalid!',
                ),
              ),
            ],
          ),
          defaultBuilder: (context) => Text('value of isValid is null!'),
        ),
      ],
    );
  }
}
