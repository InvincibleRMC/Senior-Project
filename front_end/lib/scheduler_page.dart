import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:front_end/middleware.dart';
import 'package:front_end/standard_widgets.dart';
import 'main.dart';

class SchedulerPage extends StatefulWidget {
  const SchedulerPage({Key? key}) : super(key: key);

  @override
  State<SchedulerPage> createState() => _SchedulerPageState();
}

class _SchedulerPageState extends State<SchedulerPage> {
  String? _major;
  //TODO not sure how to do concentrations
  // string _concentraion = "";
  // string _minor = "";

  List<String> _previousClasses = [];
  List<String> _preferredProfessors = [];
  List<String> _unpreferredProfessors = [];
  List<String> _preferredClasses = [];
  List<String> _unpreferredClasses = [];

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
            DropdownSearch<String>(
              items: MiddleWare.getAllMajors(),
              popupProps: const PopupProps.menu(
                  showSelectedItems: true, showSearchBox: true),
              onChanged: (String? major) => _major = major,
            ),
            // DropdownSearch<String>.multiSelection(
            //     items: MiddleWare.getAllCourses(),
            //     popupProps: const PopupPropsMultiSelection.menu(
            //         showSelectedItems: true, showSearchBox: true),
            //     onChanged: (List<String> data) => {_selectedClasses = data}),
            // TextField(
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: "email",
            //     ),
            //     onChanged: (String emailData) => {_email = emailData}),
            ElevatedButton(
              key: const Key("scheduler_button"),
              onPressed: () {
                // Ensures a Major is chosen
                if (_major == null) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Must input major'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'ok'),
                          child: const Text('ok'),
                        ),
                      ],
                    ),
                  );
                }
                // Passes information along and returns home
                else {
                  MiddleWare.scheduler();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(key: Key("home")),
                      ));
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
