import 'package:flutter/material.dart';

class AppDropDownMenu<T> extends StatefulWidget {
  final T? initialSelection;
  final ValueChanged<T?> onSelected;
  final Color backgroundColor;
  final Color fillColor;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  const AppDropDownMenu({
    super.key,
    this.initialSelection,
    required this.onSelected,
    required this.dropdownMenuEntries,
    this.backgroundColor = Colors.white,
    this.fillColor = Colors.blueGrey,
    this.borderRadius = BorderRadius.zero,
    this.elevation = 0.0,
  });

  @override
  _AppDropDownMenuState<T> createState() => _AppDropDownMenuState<T>();
}

class _AppDropDownMenuState<T> extends State<AppDropDownMenu<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: _selectedValue,
      // isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (T? newValue) {
        setState(() {
          _selectedValue = newValue;
          widget.onSelected(newValue);
        });
      },

      items: widget.dropdownMenuEntries.map((DropdownMenuEntry<T> entry) {
        return DropdownMenuItem<T>(
          value: entry.value,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              entry.leadingIcon ??
                  const SizedBox(
                    width: 24,
                  ), // Provide a default if leadingIcon is null
              const SizedBox(width: 8.0),
              Text(entry.label),
            ],
          ),
        );
      }).toList(),
      dropdownColor: widget.fillColor,
      // Note: 'style' property could be added here to style the selected item text
    );
  }
}
