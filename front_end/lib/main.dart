import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:front_end/network.dart';
import 'package:front_end/scheduler_page.dart';
import 'package:front_end/standard_widgets.dart';
import 'class_reminder_page.dart';

void main() async {
  Network().connect();
  Network().sendProfessorRequest();
  Network().sendCourseRequest();
  Network().sendMajorRequest();
  runApp(const MyApp());
}

List<String> _funny = [
  "[REDACTED] is very hot and one of the good-looking professors on campus and dresses well and as a bonus he has a very hot accent. Everything else is a nightmare. Homework is difficult and requires group work and exams are very tough. But if you are looking for eye candy he's your guy - ENGR145",
  "I don't know why he's still here. They should fire this guy - EECS314",
  "I'm sure he knows his stuff, but you wouldn't know it from the lectures, or talking to him, or his selection of course work - EECS303",
  "Lost multiple students exams and gave them zeros because \"one exam is dropped\" - ENGR145",
  "He is r/a/c/i/s/t, and has an anger problem - FSSY112",
  "I went to his office hours and he called me dumb like 10 times.  -MATH201",
  "It is too bad that 1 is the lowest rating that I can give. I would give him a flat 0 - MATH201",
  "No comment. -CHEM113",
  "If you are a CS student and are thinking about getting a project out of this class to fill in your resume, TAKE IT AND FEEL THE PAIN - ECSE290",
  "Too smart to be teaching this class - ECON308",
  "There are hours of homework each week, much of it is beyond the scope of the class, but he included it \"just for fun\" - MATH224",
  "Didnt think it was possible for my favorite subject , math, to become my least favorite - MATH224",
  "If you want to have zero social life and want to feel bad about yourself 24/7 -  PHYS115",
  "There will be moments during this class where you think to yourself, baffled, \"Wow! Is this really a professor or a student pretending to be one?\" Then, you remember, you've learned far more from other students in the class than you ever have from the professor. - CSDS341",
  "the lab component def makes you reconsider your decisions and makes you depressed - PHYS122LAB",
  "notes riddled with errors -EECS315",
  "Most days I left class wondering what the hell he just talked about for the last hour - EECS315",
  "The labs make me cry every time - CSDS101",
];

List<RotateAnimatedText> _animated = List.generate(
    _funny.length,
    (int index) =>
        RotateAnimatedText(_funny[index], textAlign: TextAlign.center));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
    Network().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StandardWidgets.standardAppBar(),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  key: const Key("class_reminder_button"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClassReminderPage(
                              key: Key("class_reminder")),
                        ));
                  },
                  child: const Text("To Class Reminder"),
                ),
                ElevatedButton(
                  key: const Key("scheduler_button"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SchedulerPage(key: Key("scheduler")),
                        ));
                  },
                  child: const Text("To Schedulers"),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.75,
              child: AnimatedTextKit(
                animatedTexts: _animated,
                repeatForever: true,
              ))
        ]));
  }
}
