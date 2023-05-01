import 'package:flutter/material.dart';
import 'package:front_end/network.dart';
import 'package:front_end/standard_widgets.dart';
import 'main.dart';
import 'dart:async';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  Map<String, List<String>> schedule = Network().getSchedule();

  Timer? t;

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if (schedule.isEmpty) {
        setState(() {
          schedule = Network().getSchedule();
          print(Network().getSchedule());
        });
      } else {
        print("timer cancelled");
        schedule = Network().getSchedule();
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    t?.cancel();
  }

  Column semesterHelper(MapEntry<String, List<String>> semester) {
    List<Text> text = List.generate(
      semester.value.length,
      (index) => Text(
        semester.value[index],
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );

    text.insert(
        0,
        Text(
          semester.key,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ));
    return Column(children: text);
  }

  Row displayHelperLarge2(Map<String, List<String>> schedule) {
    List<Column> textSchedule = List.empty(growable: true);

    for (final entry in schedule.entries) {
      textSchedule.add(semesterHelper(entry));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: textSchedule,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardWidgets.standardAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            displayHelperLarge2(schedule),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Network().clearSchedule();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(key: Key("home")),
                    ));
              },
              child: const Text("Return home"),
            ),
          ],
        ),
      ),
    );
  }
}
