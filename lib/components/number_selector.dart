import 'package:first_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  //parameters
  final String title;
  final int value;
  final Function() OnIncrement;
  final Function() OnDecrement;

  const NumberSelector({
    super.key,
    required this.title,
    required this.OnIncrement,
    required this.OnDecrement,
    required this.value,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    widget.OnDecrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.secondary,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    widget.OnIncrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.secondary,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
