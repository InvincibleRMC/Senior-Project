import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:front_end/network.dart';
import 'package:front_end/proto/service.pbgrpc.dart';
import 'package:front_end/standard_widgets.dart';
import 'main.dart';

class ClassReminderPage extends StatefulWidget {
  const ClassReminderPage({Key? key}) : super(key: key);

  @override
  State<ClassReminderPage> createState() => _ClassReminderPageState();
}

class _ClassReminderPageState extends State<ClassReminderPage> {
  List<String> _selectedClasses = [];
  String? _email;
  // this regex might be dumb
  static final RegExp _emailRegex = RegExp(r'(\w|\.)+@\w+(.\w+)+');

  final double screenPercentage = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StandardWidgets.standardAppBar(),
        body: Center(
          child: Container(
            width: screenPercentage * MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  "Input Classes you want an automatic email for when they open on SIS",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                DropdownSearch<String>.multiSelection(
                    items: Network().getCourseNames(),
                    popupProps: const PopupPropsMultiSelection.menu(
                        showSelectedItems: true, showSearchBox: true),
                    onChanged: (List<String> data) =>
                        {_selectedClasses = data}),
                TextField(
                    key: const Key("email_input_field"),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "email",
                    ),
                    onChanged: (String emailData) => {_email = emailData}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        key: const Key("back_button"),
                        // TODO: eventually make this a different color
                        // style: ButtonStyle(backgroundColor: )
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePage(key: Key("home"))));
                        },
                        child: const Text("Back")),
                    ElevatedButton(
                      key: const Key("submit_button"),
                      onPressed: () {
                        if (_selectedClasses.length < 1) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Please select at least one course.'),
                              actions: <Widget>[
                                TextButton(
                                  key: const Key("ok_button"),
                                  onPressed: () => Navigator.pop(
                                      context, 'cancel submission'),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        } else if (_email == null) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Please enter your email.'),
                              actions: <Widget>[
                                TextButton(
                                  key: const Key("ok_button"),
                                  onPressed: () => Navigator.pop(
                                      context, 'cancel submission'),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        } else if (!_emailRegex.hasMatch(_email!)) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Please enter a valid email address.'),
                              actions: <Widget>[
                                TextButton(
                                  key: const Key("ok_button"),
                                  onPressed: () => Navigator.pop(
                                      context, 'cancel submission'),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Can do NonNull assertion because inside of an not null check
                          Network().sendNotificationRequest(
                              _email!, _selectedClasses);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HomePage(key: Key("home")),
                              ));
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
