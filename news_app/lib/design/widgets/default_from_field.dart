import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  String label = '',
  required Function(String value) onChanged,
  IconData? icon,
  required FormFieldValidator<String> validator,
}) =>
    TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          icon,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorStyle: const TextStyle(color: Color.fromRGBO(244, 67, 54, 1)),
        filled: true,
      ),
    );
