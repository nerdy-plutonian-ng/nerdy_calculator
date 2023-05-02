import 'package:nerdy_calculator/models/pad_item_type.dart';

class PadItem {
  final String label;
  final PadItemType type;
  final bool isAdvanced;
  final String? description;

  const PadItem(
      {required this.label,
      required this.type,
      this.isAdvanced = false,
      this.description});
}
