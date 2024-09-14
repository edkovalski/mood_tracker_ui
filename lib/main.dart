import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mood_tracker/presentation/mood_tracker_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoodTrackerPage(),
    );
  }
}
