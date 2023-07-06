import 'package:flutter/material.dart';

class WeightAgeSelector extends StatefulWidget {
  final Function(int, int) onChange;

  const WeightAgeSelector({super.key, required this.onChange});

  @override
  State<WeightAgeSelector> createState() => _WeightAgeSelectorState();
}

class _WeightAgeSelectorState extends State<WeightAgeSelector> {
  int weightValue = 50;
  int ageValue = 21;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
      child: Row(
        children: [
          Expanded(child: weight()),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Expanded(child: age()),
        ],
      ),
    );
  }

  Widget weight() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "WEIGHT",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,

            ),
          ),
          Text(
            '$weightValue',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          valueSetters(false),
        ],
      ),
    );
  }

  Widget age() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "AGE",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Text(
            '$ageValue',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          valueSetters(true),
        ],
      ),
    );
  }

  Widget valueSetters(bool isAge) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isAge) {
                ageValue += 1;
              } else {
                weightValue += 1;
              }
            });
            widget.onChange(weightValue, ageValue);
          },
          mini: true,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isAge) {
                ageValue -= 1;
              } else {
                weightValue -= 1;
              }
            });
            widget.onChange(weightValue, ageValue);
          },
          mini: true,
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
