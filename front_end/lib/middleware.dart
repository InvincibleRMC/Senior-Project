// Abstract class is dart an interface
abstract class MiddleWare {
  // TODO probably add some class validation to front_end for users
  // maybe here or on textfield
  // https://codewithandrea.com/articles/flutter-text-field-form-validation/
  static void emailReminder(String email, List<String> classes) {
    //TODO connect to database soontm
    print("YEEYHAWHODADKAWODK");
    print(email + classes.toString());
  }

  static void scheduler() {
    //TODO connect to database soontm
  }

  // String for right now
  static List<String> getAllCourses() {
    return ["CSDS 310", "CSDS 420", "USNA 104", "EECS 102", "PHED 104"];
  }

  // String for right now
  static List<String> getAllMajors() {
    return ["TODO"];
  }
}
