import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String? hint;
  final bool? obscure;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  const FormInput({
    super.key,
    required this.label,
    this.obscure,
    this.hint,
    this.controller,
    this.validator,
    this.inputType,
    this.inputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
     return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscure ?? false,
      keyboardType: inputType,
      textInputAction: inputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text){
        if(nextFocus !=null){
        FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(36, 36, 36, 0.156)),
        ),
      ),
    );
  }
}
