import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChange});

  final List<String> colors;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              String color = widget.colors[index];
              return GestureDetector(
                onTap: () {
                  selectedColor = color;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: selectedColor == color ? AppColors.themeColor : null,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  child: Text(widget.colors[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
