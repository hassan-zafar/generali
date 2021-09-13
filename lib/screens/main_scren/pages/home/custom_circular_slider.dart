import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomCircularSlider extends StatelessWidget {
  const CustomCircularSlider({
    required this.title,
    required this.onChange,
    required this.initialValue,
    Key? key,
  }) : super(key: key);
  final String title;
  final double initialValue;
  final Function(double)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SleekCircularSlider(
          appearance: CircularSliderAppearance(
            size: 80,
            startAngle: -90,
            angleRange: 360,
            customWidths: CustomSliderWidths(
              handlerSize: 5,
              progressBarWidth: 10,
              trackWidth: 10,
            ),
            customColors: CustomSliderColors(
              progressBarColor: Colors.red,
              trackColor: Colors.white,
              dotColor: Colors.white,
            ),
          ),
          onChange: onChange,
          // max: 100,
          initialValue: initialValue,
          innerWidget: (double val) {
            return Center(
              child: Text(
                '${val.toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
