

class Degree {
    final String name;
    final int id;
    final bool hasConcentrations;

    const Degree(
        required this.name,
        required this.id,
        required this.hasConcentrations
    );

    factory Degree.fromJson(Map<String, dynamic> json) {
        return Degree(
          name: json['name'],
          id: json['id'],
          hasConcentrations: json['hasConcentrations']
        );
    }
}

class Concentration {
    final String name;
    final int id;

    const Concentration(
        required this.name,
        required this.id
    );

    factory Concentration.fromJson(Map<String, dynamic> json) {
        return Concentration(
            name: json['name'],
            id: json['id']
        );
    }
}

class DegreeSelect extends StatefulWidget {
    const DegreeSelect({super.key, required this.title});

    final String title;

    @override 
    Widget build() {

    }

    @override 
    State<DegreeSelect> createState() => _DegreeSelectState();
    
}


class _DegreeSelectState extends State<DegreeSelect> {


    void _fetchPrograms() {

    }

    void _fetchConcentrations() {

    }

    @override 
    Widget build(BuildContext context) {
        return
    }

}

