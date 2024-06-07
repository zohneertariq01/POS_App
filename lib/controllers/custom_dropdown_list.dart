import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomDropDownList extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const CustomDropDownList({
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 10.0, right: 5.0, top: 5.0, bottom: 5.0),
      child: DropdownButtonFormField<String>(
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: hoverColor,
        ),
        dropdownColor: bgColor,
        decoration: const InputDecoration(border: InputBorder.none),
        value: selectedItem,
        onChanged: onChanged, // Use the provided onChanged function
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
