import 'package:flutter/material.dart';

class DefaultTextForm extends StatelessWidget {
  const DefaultTextForm(
      {super.key,
      this.suffix,
      this.color,
      this.pressIcon,
      this.controller,
      this.change,
      this.submit,
      this.prefix,
      this.validate,
      required this.type,
      this.secure = false,
      required this.hint});
  final TextEditingController? controller;
  final void Function(String value)? change;
  final void Function(String?)? submit;
  final String? Function(String?)? validate;
  final TextInputType type;
  final bool? secure;
  final String hint;
  final IconData? suffix;
  final IconData? prefix;

  final Color? color;
  final void Function()? pressIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: controller,
        onFieldSubmitted: submit,
        validator: validate,
        onChanged: change,
        keyboardType: type,
        obscureText: secure!,
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: pressIcon,
              icon: Icon(
                prefix,
                color: color,
              )),
          suffixIcon: IconButton(
              onPressed: pressIcon,
              icon: Icon(
                suffix,
                color: color,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.grey)),
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
