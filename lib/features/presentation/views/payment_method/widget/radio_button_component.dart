import 'package:flutter/material.dart';

class CustomRadioGroup extends StatefulWidget {
  final List<String> options;
  final Function(String) onChanged;

  const CustomRadioGroup({
    Key? key,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioGroupState createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.options.map((option) {
        bool isSelected = selectedOption == option;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedOption = option;
            });
            widget.onChanged(option);
          },
          child: Container(
           padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: isSelected ? Colors.white : Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
