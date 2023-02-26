import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:front_end/middleware.dart';
import 'package:front_end/network.dart';
import 'package:front_end/results.dart';
import 'package:front_end/standard_widgets.dart';

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

  List<String>? _previousClasses;
  List<String>? _preferredProfessors;
  List<String>? _unpreferredProfessors;
  List<String>? _preferredClasses;
  List<String>? _unpreferredClasses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardWidgets.standardAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownSearch<String>(
              key: const Key("drop_down_search_major"),
              items: Network().getMajors(),
              popupProps: const PopupProps.menu(
                  showSelectedItems: true, showSearchBox: true),
              onChanged: (String? major) => _major = major,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Input Major",
                ),
              ),
            ),
            DropdownSearch<String>.multiSelection(
              key: const Key("drop_down_search_courses"),
              items: Network().getCourseNames(),
              popupProps: const PopupPropsMultiSelection.menu(
                  showSelectedItems: true, showSearchBox: true),
              onChanged: (List<String> courses) => {_previousClasses = courses},
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Input Previous Courses",
                ),
              ),
            ),
            ElevatedButton(
              key: const Key("submit_button"),
              onPressed: () {
                // Ensures a Major is chosen
                if (_major == null) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Must input major'),
                      actions: <Widget>[
                        TextButton(
                          key: const Key("ok_button"),
                          onPressed: () => Navigator.pop(context, 'ok'),
                          child: const Text('ok'),
                        ),
                      ],
                    ),
                  );
                }
                // Passes information along and returns home
                else {
                  Network().sendScheduleRequest();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ResultsPage(key: Key("home")),
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
