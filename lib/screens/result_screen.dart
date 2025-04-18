import 'package:first_app/core/app_colors.dart';
import 'package:first_app/core/text_style.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final int age;
  final int Weight;

  const ResultScreen({
    super.key,
    required this.height,
    required this.age,
    required this.Weight,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the BMI esta en cm la altura arreglalo
    double fixedHeight = height / 100;
    double imc_result = Weight / (fixedHeight * fixedHeight);

    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tu resultado:",
              style: TextStyle(
                fontSize: 38,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 21, bottom: 32),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        getTitleByImc(imc_result),
                        style: TextStyle(
                          color: getColorByImc(imc_result),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        imc_result.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 76,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          getDescriptionByImc(imc_result),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: Text("Finalizar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorByImc(double value) {
    return switch (value) {
      < 18.5 => Colors.blue,
      < 24.9 => Colors.green,
      < 29.9 => Colors.orange,
      _ => Colors.red,
    };
  }

  String getTitleByImc(double result) {
    return switch (result) {
      < 18.5 => "Bajo peso",
      < 24.9 => "Peso normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByImc(double result) {
    return switch (result) {
      < 18.5 => "Tienes un bajo peso, intenta comer más.",
      < 24.9 => "Tienes un peso normal, sigue así.",
      < 29.9 => "Tienes un sobrepeso, intenta hacer más ejercicio.",
      _ => "Tienes obesidad, consulta a un médico.",
    };
  }
}
