import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/presentation/calendar_page.dart';
import 'package:mood_tracker/presentation/widgets/mood_selector.dart';
import 'package:mood_tracker/presentation/widgets/note_input.dart';
import 'package:mood_tracker/presentation/widgets/self_evaluate_slider.dart';
import 'package:mood_tracker/presentation/widgets/stress_slider.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime specificDateTime = DateTime(2023, 1, 1, 9, 0);
    String formattedDateTime =
        DateFormat('d MMMM HH:mm', 'ru').format(specificDateTime);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalendarScreen()),
                );
              },
              icon: const Icon(Icons.calendar_month_outlined))
        ],
        title: Center(child: Text(formattedDateTime)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(58, 105, 101, 101)),
            alignment: Alignment.center,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 12),
              unselectedLabelColor: const Color.fromARGB(94, 79, 74, 74),
              indicatorWeight: 5,
              indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(24)),
              controller: _tabController,
              tabs: const [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.newspaper),
                      Text('Дневник настроения')
                    ],
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.bar_chart),
                        Text('Статистика')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MoodEntryPage(),
          StatisticsPage(),
        ],
      ),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Статистика'),
    );
  }
}

class MoodEntryPage extends StatelessWidget {
  const MoodEntryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Что чувствуешь?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            MoodSelector(),
            SizedBox(height: 20),
            StressSlider(),
            SizedBox(height: 20),
            SelfEvaluationSlider(),
            SizedBox(height: 20),
            NoteInput(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
