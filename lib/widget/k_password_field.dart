import 'package:flutter/material.dart';

class KPasswordField extends StatefulWidget {
  final String text;
  final TextEditingController? textcontroler;
  final String? Function(String?)? validator;
  final TextInputType? type;
  final IconData? icon;
  const KPasswordField(
      {Key? key,
      required this.text,
      this.icon,
      this.validator,
      this.textcontroler,
      this.type})
      : super(key: key);

  @override
  State<KPasswordField> createState() => _KPasswordFieldState();
}

class _KPasswordFieldState extends State<KPasswordField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      validator: widget.validator,
      controller: widget.textcontroler,
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: _toggle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefix: Icon(widget.icon),
        labelText: widget.text,
      ),
    );
  }
}
