import 'package:flutter/material.dart';

class AppDropdownButtonFormField<T> extends StatelessWidget {
  const AppDropdownButtonFormField({
    super.key,
    this.selectedValue,
    required this.dropdownItems,
    this.hint,
    this.onChanged,
    this.icon,
    this.isExpanded = true,
    this.iconColor,
    this.itemBuilder,
  });

  final T? selectedValue;
  final List<T> dropdownItems;
  final String? hint;

  final ValueChanged<T?>? onChanged;
  final IconData? icon;
  final bool isExpanded;
  final Color? iconColor;
  final Widget Function(T)? itemBuilder; // Custom item display in dropdown

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: (value) => value == null ? "Choose" : null,
      // dropdownColor: Colors.blueAccent,
      initialValue: selectedValue,
      onChanged: onChanged,
      items: dropdownItems.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          // child: Text(val),
          child: itemBuilder != null
              ? itemBuilder!(item) // Use custom item builder if provided
              : Text(item.toString()), // Fallback to default text display
        );
      }).toList(),
    );
  }
}
