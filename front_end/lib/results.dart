import 'package:flutter/material.dart';
import 'package:front_end/network.dart';
import 'package:front_end/standard_widgets.dart';
import 'main.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<List<String>> schedule = Network().getSchedule();

  Column displayHelper(List<String> courses) {
    List<Text> text = List.generate(
      courses.length,
      (int index) => Text(
        courses[index],
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );

    return Column(
      children: text,
    );
  }

  Column displayHelperLarge(List<List<String>> schedule) {
    List<Column> textSchedule = List<Column>.generate(
        schedule.length, (int index) => displayHelper(schedule[index]));
    var col =
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [textSchedule[0], textSchedule[1]],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [textSchedule[2], textSchedule[3]],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [textSchedule[4], textSchedule[5]],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [textSchedule[6], textSchedule[7]],
      ),
    ]);
    return col;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardWidgets.standardAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            displayHelperLarge(schedule),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
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
