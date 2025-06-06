# App Drop Down Menu

A simple and customizable Flutter package that provides styled and flexible dropdown menu widgets, including:

- `AppDropDownButton`
- `AppDropDownMenu`
- `AppDropdownButtonFormField`

Perfect for building modern dropdown menus quickly without reinventing the wheel.

---

## Features

- Customizable icons, hint texts, and styles.
- Support for both `DropdownButton` and `DropdownButtonFormField`.
- Flexible entry building with custom widgets.
- Easy integration with form validation.

---

## Getting Started

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  app_drop_down_menu: latest
```

Then run:

```bash
flutter pub get
```

---

## Usage

### 1. AppDropDownButton

```dart
AppDropDownButton(
  items: ['Option 1', 'Option 2', 'Option 3'],
  hint: 'Select an option',
  onChanged: (value) {
    print(value);
  },
  icon: Icons.arrow_drop_down,
  iconColor: Colors.blue,
)
```

### 2. AppDropDownMenu

```dart
AppDropDownMenu<String>(
  initialSelection: 'Option 1',
  dropdownMenuEntries: [
    DropdownMenuEntry(value: 'Option 1', label: 'First Option'),
    DropdownMenuEntry(value: 'Option 2', label: 'Second Option'),
  ],
  onSelected: (value) {
    print(value);
  },
  backgroundColor: Colors.white,
  fillColor: Colors.blueGrey,
)
```

### 3. AppDropdownButtonFormField

```dart
AppDropdownButtonFormField<String>(
  dropdownItems: ['Item 1', 'Item 2', 'Item 3'],
  hint: 'Please select',
  onChanged: (value) {
    print(value);
  },
  itemBuilder: (item) => Text(item),
)
```

---

## API Reference

### AppDropDownButton
- `items`: List of items to display.
- `hint`: Placeholder text.
- `onChanged`: Callback when an item is selected.
- `icon`: Icon to display in dropdown.
- `isExpanded`: Whether to expand to fill the width.
- `iconColor`: Icon color.
- `selectedValue`: Preselected value.

### AppDropDownMenu
- `initialSelection`: Default selected item.
- `onSelected`: Callback when an item is selected.
- `backgroundColor`: Background color of the widget.
- `fillColor`: Fill color of the dropdown.
- `borderRadius`: Border radius for dropdown.
- `elevation`: Shadow elevation.
- `dropdownMenuEntries`: List of `DropdownMenuEntry` items.

### AppDropdownButtonFormField
- `selectedValue`: Preselected value.
- `dropdownItems`: List of dropdown items.
- `hint`: Hint text.
- `onChanged`: Callback when an item is selected.
- `icon`: Icon to show.
- `isExpanded`: Expand to full width.
- `iconColor`: Color of the icon.
- `itemBuilder`: Custom widget builder for items.

---

## Example

Check out the example app inside the package for a complete working demo!

---

## License

This project is licensed under the MIT License.

---

## Contributions

Contributions, issues, and feature requests are welcome!

Feel free to submit a pull request.

---

## Author

Developed by [Shohidul Islam].

---

Enjoy using `app_drop_down_menu`! 🎉

