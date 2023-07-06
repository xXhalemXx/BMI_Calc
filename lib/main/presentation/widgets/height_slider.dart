import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  final Function(double) onHeightChanged;
  const HeightSlider({super.key,required this.onHeightChanged});

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double height=180;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "HEIGHT",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            selectedHeight(),
            heightSlider(),
          ],
        ),
      ),
    );
  }
  Widget selectedHeight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '${height.round()}',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        const Text(
          'cm',
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget heightSlider() {
    return Slider(
        value: height,
        max: 300,
        min: 70,
        activeColor: Colors.greenAccent,
        inactiveColor: Colors.white,
        onChanged: (value) {
         setState(() {
           height=value;
           widget.onHeightChanged(value);
         });
        });
  }
}
