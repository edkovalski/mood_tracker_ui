import 'package:flutter/material.dart';

class StressSlider extends StatelessWidget {
  const StressSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Уровень стресса'),
        Slider(
          activeColor: Colors.orangeAccent,
          value: 0.5,
          min: 0,
          max: 1,
          divisions: 10,
          label: 'Средний',
          onChanged: (double value) {},
        ),
        const Row(
          children: [
            Text(
              'Низкий',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 250,
            ),
            Text(
              'Высокий',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
