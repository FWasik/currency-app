import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  String dropdownValue;
  final Function(String) onChanged;
  final List<String> list;

  CustomDropdown(
      {Key? key,
      required this.dropdownValue,
      required this.onChanged,
      required this.list})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 160,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColorDark, width: 2)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.black12,
          ),
          dropdownColor: Theme.of(context).primaryColor,
          value: widget.dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              widget.dropdownValue = newValue!;
              widget.onChanged(newValue);
            });
          },
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          items: widget.list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
