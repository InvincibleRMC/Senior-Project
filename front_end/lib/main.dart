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
  "[REDACTED] is very hot and one of the good-looking professors on campus and dresses well and as a bonus he has a very hot accent. Everything else is a nightmare. Homework is difficult and requires group work and exams are very tough. But if you are looking for eye candy he's your guy",
  "I don't know why he's still here. They should fire this guy",
  "I'm sure he knows his stuff, but you wouldn't know it from the lectures, or talking to him, or his selection of course work",
  "Lost multiple students exams and gave them zeros because \"one exam is dropped\"",
  "He is r/a/c/i/s/t, and has an anger problem",
  "I went to his office hours and he called me dumb like 10 times.",
  "It is too bad that 1 is the lowest rating that I can give. I would give him a flat 0",
  "No comment.",
  "If you are a CS student and are thinking about getting a project out of this class to fill in your resume, TAKE IT AND FEEL THE PAIN",
  "Too smart to be teaching this class",
  "There are hours of homework each week, much of it is beyond the scope of the class, but he included it \"just for fun\"",
  "Didnt think it was possible for my favorite subject , math, to become my least favorite",
  "If you want to have zero social life and want to feel bad about yourself 24/7",
  "There will be moments during this class where you think to yourself, baffled, \"Wow! Is this really a professor or a student pretending to be one?\" Then, you remember, you've learned far more from other students in the class than you ever have from the professor.",
  "the lab component def makes you reconsider your decisions and makes you depressed",
  "notes riddled with errors",
  "Most days I left class wondering what the hell he just talked about for the last hour",
  "The labs make me cry every time",
  "His mumbling and caveman level handwriting make lectures eye-gougingly painful",
  "No way to survive through this course.",
  "The good Lord tests us all in different ways but if this is the man God has chosen to serve penance upon me then I must be one of His greatest warriors against evil. I will be guarding the pearly gates of heaven when i pass on from this world, armed with extensive knowledge about the knee.",
  "I talked about him more than once in therapy.",
  "Somehow, he graded the final exam so that the lowest possible score was -33%. (Yes. Negative.)"
];

List<RotateAnimatedText> _animated = List.generate(
    _funny.length,
    (int index) => RotateAnimatedText(_funny[index],
        duration: const Duration(seconds: 4), textAlign: TextAlign.center));

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
