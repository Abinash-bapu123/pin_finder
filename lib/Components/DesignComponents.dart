import 'package:flutter/material.dart';

InputBorder getBorder({
  Color borderColor = Colors.blue,
  double radious = 10.0,
}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(radious),
    ),
  );
}
