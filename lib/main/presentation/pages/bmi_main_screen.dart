import 'package:bmi/main/presentation/widgets/dialog_result.dart';
import 'package:bmi/main/presentation/widgets/height_slider.dart';
import 'package:bmi/main/presentation/widgets/male_female_selector.dart';
import 'package:bmi/main/presentation/widgets/weight_age_selector.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 180;
  bool isMale = true;
  int weight=50;
  int age=21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF360536),
        title: Center(child: Text(widget.title,style: const TextStyle(color: Colors.white),)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF360536),
        ),
        child: Column(
          children: [
            Expanded(
              child: MaleFemaleSelector(
                onChange: (newValue) {
                  isMale = newValue;
                },
              ),
            ),
            Expanded(
              child: HeightSlider(
                onHeightChanged: (newHeight) {
                  height = newHeight;
                },
              ),
            ),
            Expanded(
              child: WeightAgeSelector(
                onChange: (newWeight, newAge) {
                  age=newAge;
                  weight=newWeight;
                },
              ),
            ),
            calculateButton(),
          ],
        ),
      ),
    );
  }

  Widget calculateButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: MaterialButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return DialogResult(isMale: isMale, height: height, weight: weight,);
          });
        },
        color: Colors.greenAccent,
        child: const Text(
          'CALCULATE',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
