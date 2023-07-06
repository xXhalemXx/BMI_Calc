import 'package:flutter/material.dart';

class MaleFemaleSelector extends StatefulWidget {
  final Function(bool) onChange;

  const MaleFemaleSelector({super.key, required this.onChange});

  @override
  State<MaleFemaleSelector> createState() => _MaleFemaleSelectorState();
}

class _MaleFemaleSelectorState extends State<MaleFemaleSelector> {
  bool isMale = true;
  Color selectedColor = Colors.greenAccent;
  Color unSelectedColor = Colors.grey.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
      child: Row(
        children: [
          Expanded(child: male()),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Expanded(child: female()),
        ],
      ),
    );
  }

  Widget male() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = true;
          widget.onChange(true);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isMale ? selectedColor : unSelectedColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.male,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.25,
            ),
            const Text(
              'MALE',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget female() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = false;
          widget.onChange(false);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isMale ? unSelectedColor : selectedColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.female,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.25,
            ),
            const Text(
              'FEMALE',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
