import 'package:flutter/material.dart';

typedef FormTextFieldValidator = String? Function(String? value);

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    this.validator,
    this.onSubmitted,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.isObscured = false,
    this.suffix,
    this.error,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FormTextFieldValidator? validator;

  final ValueChanged<String>? onSubmitted;

  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String title;

  final bool isObscured;
  final Widget? suffix;
  final String? error;

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  FormTextFieldValidator? _validator;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
    _validator = widget.validator;
  }

  void _onFocusChanged() {
    if (widget.focusNode.hasFocus) {
      _disableValidation();
    } else {
      _enableValidation();
    }
  }

  void _disableValidation() {
    setState(() {
      _validator = (String? value) => null;
    });
  }

  void _enableValidation() {
    setState(() {
      _validator = widget.validator;
    });
  }

  Key? _getKey({String prefix = 'LABEL_'}) {
    var label = prefix;
    final key = widget.key;
    if (key is LabeledGlobalKey) {
      // LabeledGlobalKey uses debugLabel in toString()
      // but adds a shortHash with a space before it
      // so we skip it to get debugLabel
      label += key.toString().split(' ').last.replaceFirst(']', '');
    } else if (key is ValueKey<String>) {
      label += key.value;
    } else {
      return null;
    }
    return Key(label);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
        ),
        const SizedBox(height: 8),
        TextFormField(
          key: _getKey(prefix: 'FIELD_'),
          controller: widget.controller,
          keyboardType: widget.textInputType,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          obscureText: widget.isObscured,
          validator: _validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: _enableValidation,
          onFieldSubmitted: (String value) {
            widget.nextFocusNode?.requestFocus();
            widget.onSubmitted?.call(value);
          },
          decoration: InputDecoration(
            suffix: widget.suffix ?? const SizedBox.shrink(),
            errorMaxLines: 4,
            errorText: widget.error,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
              borderSide: BorderSide(color: Colors.indigoAccent),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }
}
