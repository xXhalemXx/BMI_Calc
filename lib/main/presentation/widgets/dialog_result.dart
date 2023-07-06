import 'dart:math';

import 'package:flutter/material.dart';

class DialogResult extends StatelessWidget {
  final double height;
  final int weight;
  final bool isMale;

  const DialogResult(
      {super.key,
      required this.isMale,
      required this.height,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    int result = calculateBMI(weight, height);
    return AlertDialog(
      title: const Text('result'),
      content: SizedBox(
          width: 200,
          height: 70,
          child: Center(
              child: Text(
                  'BMI = $result \nGender :${isMale ? 'Male' : "Female"}'))),
      actions: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )),
      ],
    );
  }

  int calculateBMI(int weight, double height) {
    // Calculate the BMI using the formula: weight / height^2
    double bmi = weight / pow(height / 100, 2);

    // Return the BMI rounded to two decimal places
    return bmi.round();
  }
}
