import 'package:first_app/components/gender_selector.dart';
import 'package:first_app/components/height_selector.dart';
import 'package:first_app/components/number_selector.dart';
import 'package:first_app/core/app_colors.dart';
import 'package:first_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 80;
  double _height = 220;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          height: _height,
          onHeightChanged: (double value) {
            setState(() {
              _height = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Peso",
                  OnIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  OnDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                  value: selectedWeight,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "Edad",
                  OnIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                  OnDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  value: selectedAge,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 40,
          ),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ResultScreen(
                          height: _height,
                          age: selectedAge,
                          Weight: selectedWeight,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
