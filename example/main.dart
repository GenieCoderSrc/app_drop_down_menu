import 'package:flutter/material.dart';
import 'package:app_drop_down_menu/app_drop_down_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Drop Down Menu Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DropDownExamplePage(),
    );
  }
}

class DropDownExamplePage extends StatefulWidget {
  const DropDownExamplePage({super.key});

  @override
  State<DropDownExamplePage> createState() => _DropDownExamplePageState();
}

class _DropDownExamplePageState extends State<DropDownExamplePage> {
  String? _selectedValue1;
  String? _selectedValue2;
  String? _selectedValue3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drop Down Menu Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AppDropDownButton:'),
            AppDropDownButton(
              items: const ['Apple', 'Banana', 'Cherry'],
              hint: 'Select a fruit',
              selectedValue: _selectedValue1,
              onChanged: (value) {
                setState(() {
                  _selectedValue1 = value as String;
                });
              },
              icon: Icons.arrow_drop_down_circle,
              iconColor: Colors.red,
            ),
            const SizedBox(height: 24),
            const Text('AppDropDownMenu:'),
            AppDropDownMenu<String>(
              initialSelection: 'Dog',
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Dog', label: 'Dog'),
                DropdownMenuEntry(value: 'Cat', label: 'Cat'),
                DropdownMenuEntry(value: 'Bird', label: 'Bird'),
              ],
              onSelected: (value) {
                setState(() {
                  _selectedValue2 = value;
                });
              },
              fillColor: Colors.blue[50]!,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 24),
            const Text('AppDropdownButtonFormField:'),
            AppDropdownButtonFormField<String>(
              dropdownItems: const ['Red', 'Green', 'Blue'],
              hint: 'Pick a color',
              selectedValue: _selectedValue3,
              onChanged: (value) {
                setState(() {
                  _selectedValue3 = value;
                });
              },
              itemBuilder:
                  (item) =>
                      Text(item, style: const TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
