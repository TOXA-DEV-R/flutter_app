import 'package:flutter/material.dart';

class CustomTextUzs extends Text {
  CustomTextUzs(super.data);

  @override
  String? get data => "${super.data} UZS";
}
