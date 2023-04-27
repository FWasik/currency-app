import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  String? dropdownValue;
  String? hintText;
  final Function(String) onChanged;
  final List<String> options;

  CustomDropdown(
      {Key? key,
      required this.dropdownValue,
      required this.onChanged,
      required this.options,
      this.hintText})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: DropdownButtonFormField(
        hint: widget.hintText != null ? Text(widget.hintText!) : null,
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
        style: const TextStyle(fontWeight: FontWeight.bold),
        items: widget.options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: SizedBox(child: Text(value)),
          );
        }).toList(),
      ),
    );
  }
}
