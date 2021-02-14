import 'package:flutter/material.dart';
import 'package:flutter_app/models/Student.dart';
import 'package:flutter_app/validation/student_validator.dart';

class StudentAdd extends StatefulWidget{
  List<Student> students;
  StudentAdd(List<Student> students)
  {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState(students);
  }

}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;

  var student = Student.withOutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students)
  {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeNameField(),
              buildSubmitButton(),
            ],
          ),
        ),
      )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Enes"),
      validator: validateFirstName,
      onSaved: (String value){
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Kamış"),
      validator: validateLastName,
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Sınav Notu",hintText: "75"),
      validator: validateGrade,
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }

 Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
          if(formKey.currentState.validate())
            {
              formKey.currentState.save();
              students.add(student);
              saveStudent();
              Navigator.pop(context);
            }
      },
    );
  }

  void saveStudent() {
    print(student.firstName + " "+ student.lastName + " ");
    print(student.grade);
  }

}

