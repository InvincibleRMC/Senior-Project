import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:front_end/middleware.dart';
import 'package:front_end/standard_widgets.dart';

import 'main.dart';

class ClassReminderPage extends StatelessWidget {
  ClassReminderPage({Key? key}) : super(key: key);

  List<String> selectedClasses_ = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardWidgets.standardAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownSearch<String>.multiSelection(
                items: MiddleWare.getAllCourses(),
                popupProps: const PopupPropsMultiSelection.menu(
                    showSelectedItems: true),
                onChanged: (List<String> data) => selectedClasses_ = data),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "email",
              ),
            ),
            ElevatedButton(
              key: const Key("scheduler_button"),
              onPressed: () {
                MiddleWare.emailReminder("temp", selectedClasses_);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(key: Key("home")),
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
