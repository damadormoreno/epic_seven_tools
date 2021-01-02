import 'package:flutter/cupertino.dart';

extension StringExtension on String {
  String toIntelliTrim() {
    return this.length > 21 ? '${this.substring(0, 21)}...' : this;
  }
}
