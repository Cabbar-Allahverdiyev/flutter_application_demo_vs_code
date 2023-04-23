class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50)
      message = "Kecdi";
    else if (this.grade > 40)
      message = "Yoxlamaya qaldi";
    else
      message = "Kesildi";

    this.status = message;
    return this.status;
  }
}
