import 'package:flutter/material.dart';

// Example DropdownMenu widget
class AppDropDownMenu<T> extends StatefulWidget {
  final T? initialSelection;
  final ValueChanged<T?> onSelected;
  final Color backgroundColor;
  final Color fillColor;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  const AppDropDownMenu({super.key, 
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
                      width: 24), // Provide a default if leadingIcon is null
              const SizedBox(width: 8.0),
              Text(entry.label ?? ''),
            ],
          ),
        );
      }).toList(),
      dropdownColor: widget.fillColor,
      // Note: 'style' property could be added here to style the selected item text
    );
  }
}

// class AppDropDownMenu<T> extends StatelessWidget {
//   final List<DropdownMenuEntry<T>> dropdownMenuEntries;
//   final T? initialSelection;
//   final Function(T?) onSelected;
//   final String? hintText;
//   final Color? backgroundColor;
//   final Color? fillColor;
//   final BorderRadius? borderRadius;
//   final double? elevation;
//
//   const AppDropDownMenu({
//     super.key,
//     required this.dropdownMenuEntries,
//     this.initialSelection,
//     required this.onSelected,
//     this.hintText,
//     this.backgroundColor,
//     this.fillColor,
//     this.borderRadius,
//     this.elevation,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<T>(
//       width: double.infinity,
//       menuStyle: MenuStyle(
//         backgroundColor: WidgetStateProperty.all<Color>(
//             backgroundColor ?? Colors.blueGrey.shade50),
//         padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(8.0)),
//         shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: borderRadius ?? BorderRadius.circular(15.0),
//           ),
//         ),
//       ),
//       initialSelection: initialSelection,
//       dropdownMenuEntries: dropdownMenuEntries,
//       onSelected: (T? selectedValue) {
//         onSelected(selectedValue);
//         if (selectedValue != null) {
//           debugPrint(
//               'GenericDropdownMenu | build | ${selectedValue.toString()}');
//         }
//       },
//     );
//   }
// }

// // Usage example:
//
// final List<DropdownMenuEntry<DBType>> dropdownEntries = [
//   DropdownMenuEntry<DBType>(
//     value: DBType.fireStore,
//     label: "Firestore",
//     leadingIcon: Icon(Icons.storage),
//   ),
//   DropdownMenuEntry<DBType>(
//     value: DBType.mySql,
//     label: "MySQL",
//     leadingIcon: Icon(Icons.database),
//   ),
//   // Add more options here
// ];

//     return AppDropDownMenu<DBType>(
//       initialSelection: DBType.fireStore,
//       dropdownMenuEntries: dropdownEntries,
//       onSelected: (DBType? dbType) {
//         if (dbType != null) {
//           debugPrint('Selected DB: ${dbType.name}');
//         }
//       },
//       backgroundColor: Colors.white,
//       fillColor: Colors.blueGrey.shade50,
//       borderRadius: BorderRadius.circular(10.0),
//       elevation: 4.0,
//       // dropdownMenuEntries: dbOptions.map((DBTypeOption option) {
//       //   return DropdownMenuEntry<DBType>(
//       //     value: option.dbType ?? DBType.fireStore,
//       //     label: option.label ?? "Fire Store",
//       //     leadingIcon: Icon(option.icon),
//       //   );
//       // }).toList(),
//     );
