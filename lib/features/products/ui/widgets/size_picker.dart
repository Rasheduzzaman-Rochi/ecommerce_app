import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              String Size = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  selectedColor = Size;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: selectedColor == Size ? AppColors.themeColor : null,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  child: Text(widget.sizes[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
