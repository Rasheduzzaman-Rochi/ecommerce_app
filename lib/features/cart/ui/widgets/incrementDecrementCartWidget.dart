import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatefulWidget {
  const IncrementDecrementWidget({super.key, this.onChange, required this.initialQuantity});

  final Function(int)? onChange; // Callback function to notify parent about count change
  final int initialQuantity; // Initial quantity value

  @override
  State<IncrementDecrementWidget> createState() =>
      _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState
    extends State<IncrementDecrementWidget> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {
            if (count > 1) {
              setState(() {
                count--;
                widget.onChange?.call(count); // Notify parent with new count
              });
            }
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
        Text(
          '$count',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            if (count < 20) {
              setState(() {
                count++;
                widget.onChange?.call(count); // Notify parent with new count
              });
            }
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}