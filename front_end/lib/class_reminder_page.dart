import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:front_end/middleware.dart';
import 'package:front_end/standard_widgets.dart';

import 'main.dart';

class ClassReminderPage extends StatelessWidget {
  ClassReminderPage({Key? key}) : super(key: key);

  List<String> _selectedClasses = [];
  String _email = "";

  Future<List<String>> _getData(String filter) async {
    List<String> all = MiddleWare.getAllCourses();
    all.retainWhere((c) => c.contains(filter));
    return all;
  }

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
              key: const Key("scheduler_button"),
              onPressed: () {
                MiddleWare.emailReminder(_email, _selectedClasses);
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
