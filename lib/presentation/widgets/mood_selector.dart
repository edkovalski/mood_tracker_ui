import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mood {
  final String label;

  final Image image;
  final List<String> options;
  Mood(this.label, this.image, this.options);
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 80,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black,
            spreadRadius: 10,
            blurRadius: 5,
            offset: Offset(7, 8))
      ]),
      child: Column(
        children: [image, Text(label)],
      ),
    );
  }
}

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  String? _selectedMood;
  final List<String> _selectedOptions = [];

  final List<Mood> moods = [
    Mood("Радость", const Image(image: AssetImage('assets/images/happy.png')), [
      "Возбуждение",
      "Восторг",
      "Игривость",
      "Наслаждение",
      "Очарование",
      "Осознанность"
    ]),
    Mood("Страх", const Image(image: AssetImage('assets/images/fear.png')), [
      "Тревога",
      "Беспокойство",
      "Паника",
      "Ужас",
      "Испуг",
      "Ощущение уязвимости",
      "Нервозность",
    ]),
    Mood("Бешенство", const Image(image: AssetImage('assets/images/anger.png')),
        ["Гнев", "Ярость", "Раздражение", "Ненависть", "Злоба"]),
    Mood("Грусть", const Image(image: AssetImage('assets/images/sadness.png')),
        ["Печаль", "Уныние", "Одиночество", "Тоска", "Разочарование"]),
    Mood("Спокойствие",
        const Image(image: AssetImage('assets/images/calmness.png')), [
      "Умиротворение",
      "Безмятежность",
      "Расслабленность",
      "Удовлетворенность",
      "Гармония"
    ]),
    Mood(
        "Сила",
        const Image(image: AssetImage('assets/images/strengthness.png')),
        ["Мощь", "Самоуверенность", "Энергичность", "Власть", "Неуязвимость"]),
  ];

  void _selectMood(String mood) {
    setState(() {
      if (_selectedMood == mood) {
        _selectedMood = null;
        _selectedOptions.clear();
      } else {
        _selectedMood = mood;
        _selectedOptions.clear(); // Reset sub-option when selecting a new mood
      }
    });
  }

  void _selectOption(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: moods.map((mood) {
                bool isSelected = _selectedMood == mood.label;
                return GestureDetector(
                  onTap: () => _selectMood(mood.label),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isSelected
                                ? Colors.orange
                                : Colors.transparent),
                        color: Colors.white,
                        borderRadius: const BorderRadiusDirectional.vertical(
                            top: Radius.circular(50),
                            bottom: Radius.circular(50)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(15, 0, 0, 0),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1))
                        ]),
                    child: Column(
                      children: [
                        mood.image,
                        Text(
                          mood.label,
                          style: TextStyle(
                              color: isSelected ? Colors.orange : Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        if (_selectedMood != null)
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: moods
                .firstWhere((mood) => mood.label == _selectedMood)
                .options
                .map((option) {
              bool isOptionSelected = _selectedOptions.contains(option);
              return ChoiceChip(
                showCheckmark: false,
                label: Text(option),
                selected: isOptionSelected,
                onSelected: (_) => _selectOption(option),
                selectedColor: Colors.orangeAccent,
              );
            }).toList(),
          ),
      ],
    );
  }
}
