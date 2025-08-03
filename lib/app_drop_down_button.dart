import 'package:flutter/material.dart';

// List<String> items = ['One', 'Two', 'Three'];

class AppDropDownButton extends StatelessWidget {
  const AppDropDownButton({
    super.key,
    required this.items,
    this.hint,
    this.onChanged,
    this.icon,
    this.isExpanded = true,
    this.iconColor,
    this.selectedValue,
  });

  final List<String> items;
  final String? hint;
  final ValueChanged? onChanged;
  final IconData? icon;
  final bool isExpanded;
  final Color? iconColor;
  final String? selectedValue;

  // late String _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: Icon(icon, color: iconColor),
      hint: Text(
        hint ?? selectedValue ?? 'Default',
        // style: const TextStyle(color: Colors.blue),
      ),
      // value: selectedValue,
      isExpanded: isExpanded,
      iconSize: 30.0,
      style: const TextStyle(color: Colors.blue),
      items:
          items.map((val) {
            return DropdownMenuItem<String>(value: val, child: Text(val));
          }).toList(),
      onChanged: onChanged,
    );
  }
}
