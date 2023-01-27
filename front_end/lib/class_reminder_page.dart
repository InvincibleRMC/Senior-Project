import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:front_end/middleware.dart';
import 'package:front_end/standard_widgets.dart';
import 'main.dart';

class ClassReminderPage extends StatefulWidget {
  const ClassReminderPage({Key? key}) : super(key: key);

  @override
  State<ClassReminderPage> createState() => _ClassReminderPageState();
}

class _ClassReminderPageState extends State<ClassReminderPage> {
  List<String> _selectedClasses = [];
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardWidgets.standardAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              "Input Classes you want an automatic email for when they open on SIS",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            DropdownSearch<String>.multiSelection(
                items: MiddleWare.getAllCourses(),
                popupProps: const PopupPropsMultiSelection.menu(
                    showSelectedItems: true, showSearchBox: true),
                onChanged: (List<String> data) => {_selectedClasses = data}),
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "email",
                ),
                onChanged: (String emailData) => {_email = emailData}),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                MiddleWare.emailReminder(_email, _selectedClasses);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(key: Key("home")),
                    ));
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
