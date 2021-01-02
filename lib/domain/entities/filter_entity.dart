import 'package:flutter/foundation.dart';

class FilterEntity {
  final Map<String, bool> attributteFilters;
  final Map<String, bool> roleFilters;
  final Map<int, bool> starFilters;

  FilterEntity({
    @required this.attributteFilters,
    @required this.roleFilters,
    @required this.starFilters,
  });
}
