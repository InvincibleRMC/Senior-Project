import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_end/main.dart';
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
  final List<String> _semesterOptions = [
    "Fall1",
    "Spring1",
    "Fall2",
    "Spring2",
    "Fall3",
    "Spring3",
    "Fall4",
    "Spring4"
  ];

  final List<String> _departementOptions = [
    "CSDS",
    "MATH",
    "EBME",
    "ECSE",
    "BIOL",
    "NEUR",
    "COGS",
    "PHYS",
    "SYBB",
    "ACCT",
    "BUAI",
    "AFST",
    "AKKD",
    "AMST",
    "ANAT",
    "ANEE",
    "ANTH",
    "ARAB",
    "ARTH",
    "ARTS",
    "ASIA",
    "ASTR",
    "BAFI",
    "BETH",
    "BIOC",
    "BLAW",
    "BTEC",
    "CHEM",
    "CHIN",
    "CHST",
    "CLBY",
    "CLSC",
    "CMED",
    "COSI",
    "CRSP",
    "DANC",
    "DESN",
    "DSCI",
    "ECHE",
    "ECIV",
    "ECON",
    "EDUC",
    "EEPS",
    "EMAC",
    "EMAE",
    "EMBA",
    "EMSE",
    "ENGL",
    "ENGR",
    "ENTP",
    "ESTD",
    "ETHS",
    "FNCE",
    "FRCH",
    "FSCC",
    "FSSO",
    "FSSY",
    "FSTS",
    "FTEC",
    "GENE",
    "GERO",
    "GREK",
    "GRMN",
    "HSMC",
    "HSTY",
    "HUMN",
    "IBMS",
    "IDHS",
    "IIME",
    "INTH",
    "ITAL",
    "JAPN",
    "JDST",
    "LATN",
    "LAWS",
    "LEAP",
    "LING",
    "MBAC",
    "MBAP",
    "MBIO",
    "MGMT",
    "MGRD",
    "MIDS",
    "MKMR",
    "MLIT",
    "MLSC",
    "MMED",
    "MPHP",
    "MPOD",
    "MUDE",
    "MUED",
    "MUEN",
    "MUGN",
    "MUHI",
    "MUSP",
    "MUTH",
    "MVIR",
    "NTRN",
    "NUAN",
    "NUMN",
    "NUND",
    "NUNP",
    "OPMT",
    "OPRE",
    "ORBH",
    "PATH",
    "PHED",
    "PHIL",
    "PHOL",
    "PHRM",
    "PLCY",
    "PORT",
    "POSC",
    "PQHS",
    "PSCL",
    "RGME",
    "RLGN",
    "RUSN",
    "SASS",
    "SCMG",
    "SJUS",
    "SOCI",
    "SPAN",
    "STAT",
    "THTR",
    "UNIV",
    "USNA",
    "USSO",
    "USSY",
    "WGST",
    "WLIT",
  ];

  String? _semester;
  int? _minCredit;
  int? _maxCredit;
  List<String>? _previousClasses;
  List<String>? _preferredProfessors;
  List<String>? _unpreferredProfessors;
  List<String>? _preferredClasses;
  List<String>? _unpreferredClasses;

  final double screenPercentage = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StandardWidgets.standardAppBar(),
        body: Center(
          child: SizedBox(
            width: screenPercentage * MediaQuery.of(context).size.width,
            child: ListView(
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
                DropdownSearch<String>(
                  key: const Key("drop_down_search_school"),
                  items: _departementOptions,
                  popupProps: const PopupProps.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (String? major) => _major = major,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Department Options",
                    ),
                  ),
                ),
                DropdownSearch<String>(
                  key: const Key("drop_down_search_semester"),
                  items: _semesterOptions,
                  popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (String? sem) => _semester = sem,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Current Semester",
                    ),
                  ),
                ),
                TextField(
                  onChanged: (String min) => _minCredit = int.parse(min),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input minimum amount of desired credit hours',
                  ),
                ),
                TextField(
                  onChanged: (String max) => _maxCredit = int.parse(max),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input Maximum amount of desired credit hours',
                  ),
                ),
                DropdownSearch<String>.multiSelection(
                  key: const Key("drop_down_search_courses"),
                  items: Network().getCourseNames(),
                  popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (List<String> courses) =>
                      {_previousClasses = courses},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Previous Courses",
                    ),
                  ),
                ),
                DropdownSearch<String>.multiSelection(
                  key: const Key("drop_down_preferred_courses"),
                  items: Network().getCourseNames(),
                  popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (List<String> courses) =>
                      {_preferredClasses = courses},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Preferred Courses",
                    ),
                  ),
                ),
                DropdownSearch<String>.multiSelection(
                  key: const Key("drop_down_unpreferred_courses"),
                  items: Network().getCourseNames(),
                  popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (List<String> courses) =>
                      {_unpreferredClasses = courses},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Unpreferred Courses",
                    ),
                  ),
                ),
                DropdownSearch<String>.multiSelection(
                  key: const Key("drop_down_preferred_professors"),
                  items: Network().getProfessorNames(),
                  popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (List<String> professors) =>
                      {_preferredProfessors = professors},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Preferred Professors",
                    ),
                  ),
                ),
                DropdownSearch<String>.multiSelection(
                  key: const Key("drop_down_unpreferred_professors"),
                  items: Network().getProfessorNames(),
                  popupProps: const PopupPropsMultiSelection.menu(
                      showSelectedItems: true, showSearchBox: true),
                  onChanged: (List<String> professors) =>
                      {_unpreferredProfessors = professors},
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Input Unpreferred Professors",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        key: const Key("back_button"),
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
                        } else if (_semester == null) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Must input semester'),
                              actions: <Widget>[
                                TextButton(
                                  key: const Key("ok_button"),
                                  onPressed: () => Navigator.pop(context, 'ok'),
                                  child: const Text('ok'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Network().sendScheduleRequest(
                              _major!,
                              _semester!,
                              _minCredit,
                              _maxCredit,
                              _previousClasses,
                              _preferredClasses,
                              _unpreferredClasses,
                              _preferredProfessors,
                              _unpreferredProfessors);
                          // TODO Waiting page?

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ResultsPage(key: Key("results")),
                              ));
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
