import 'package:flutter/material.dart';

class SelfEvaluationSlider extends StatelessWidget {
  const SelfEvaluationSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Самооценка'),
        Slider(
          activeColor: Colors.orangeAccent,
          value: 0.5,
          min: 0,
          max: 1,
          divisions: 10,
          label: 'Средняя',
          onChanged: (double value) {},
        ),
        const Row(
          children: [
            Text(
              'Неверенность',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 175,
            ),
            Text(
              'Уверенность',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
