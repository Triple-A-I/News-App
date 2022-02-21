import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  String label = '',
  required FormFieldValidator validate,
  required Function(String value) onChanged,
  IconData? icon,
}) =>
    TextFormField(
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      controller: controller,
      keyboardType: type,
      validator: validate,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          hintText: label,
          filled: true),
    );
