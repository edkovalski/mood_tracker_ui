import 'package:flutter/material.dart';

class NoteInput extends StatefulWidget {
  const NoteInput({super.key});

  @override
  State<NoteInput> createState() => _NoteInputState();
}

class _NoteInputState extends State<NoteInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isNoteEntered = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        _isNoteEntered = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Введите заметку',
          ),
          maxLines: 3,
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: _isNoteEntered
              ? () {
                  showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                            alignment: Alignment.center,
                            title: Center(child: Text('Все окей')),
                          ));
                }
              : null,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              _isNoteEntered ? Colors.orangeAccent : Colors.grey,
            ),
          ),
          child: Text(
            'Сохранить',
            style: TextStyle(
                color: _isNoteEntered
                    ? Colors.white
                    : const Color.fromARGB(255, 78, 76, 76)),
          ),
        ),
      ],
    );
  }
}
