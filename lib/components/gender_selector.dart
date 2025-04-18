import 'package:first_app/core/app_colors.dart';
import 'package:first_app/core/text_style.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //hombre
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = "Hombre";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      _selectedGender == "Hombre"
                          ? AppColors.secondary
                          : AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/male.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text("Hombre", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //mujer
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = "Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                bottom: 16,
                right: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      _selectedGender == "Mujer"
                          ? AppColors.secondary
                          : AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/female.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text("Mujer", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
