import 'package:flutter/material.dart';

class CommonDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const CommonDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: selectedValue,
            onChanged: onChanged,
            items: items.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: value == 'Delete'
                      ? const TextStyle(color: Colors.red)
                      : null,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
