import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(
      {super.key, required this.hintTextContent, required this.regRxpContent});

  final String hintTextContent;
  final String regRxpContent;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: widget.hintTextContent,
            hintStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.hintTextContent} can not be empty';
          }
          RegExp Exp = RegExp(widget.regRxpContent);
          if (!Exp.hasMatch(value)) {
            return 'Your ${widget.hintTextContent} is invalid';
          }
          return null;
        },
      ),
    );
  }
}
