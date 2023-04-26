import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  String dropdownValue;
  final Function(String) onArgumentChanged;

  CustomDropdown(
      {Key? key, required this.dropdownValue, required this.onArgumentChanged})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<String> list = ["Chart", "Table"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: DropdownButton<String>(
            value: widget.dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String? value) {
              setState(() {
                widget.dropdownValue = value!;
                widget.onArgumentChanged(value);
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
