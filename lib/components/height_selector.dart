import 'package:first_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class HeightSelector extends StatefulWidget {
  final double height;
  final Function(double) onHeightChanged;
  const HeightSelector({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text(
                'Altura',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '${widget.height.toStringAsFixed(0)} cm',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Slider(
                value: widget.height,
                min: 150,
                max: 220,
                divisions: 70,
                label: widget.height.round().toString(),
                onChanged: (double value) {
                  widget.onHeightChanged(value);
                },
                activeColor: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
