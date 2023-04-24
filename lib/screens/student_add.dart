import 'package:flutter/material.dart';
import 'package:flutter_application_demo_vs_code/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  // StudentAdd(List<Student> students) {
  //   this.students = students;
  // }
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();

  Student student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Telebe"),
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeNameField(),
                buildSubmitButton()
              ],
            ),
          )),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Telebe Adi", hintText: "Cabbar"),
      onSaved: (String? value) {
        student.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Telebe Soyadi", hintText: "Allahverdiyev"),
      onSaved: (String? value) {
        student.lastName = value.toString();
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldigi bal", hintText: "65"),
      onSaved: (String? value) {
        student.grade = int.parse(value.toString());
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        onPressed: () {
          formKey.currentState!.save();
          widget.students.add(student);
          Navigator.pop(context);
        },
        child: Text("Yadda saxla"));
  }
}
