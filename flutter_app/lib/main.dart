import 'package:flutter/material.dart';
import 'package:flutter_app/models/Student.dart';

void main() {
  runApp(MaterialApp(home: MyApp())); //materialApp
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String karsilamaMesaji = "Öğrenci Takip Sistemi";

  String mesaj = "Gövde Kısmı";

  String sonuc = "";

  Student selectedStudent = Student.WithId(0, "", "", 0);

  List<Student> students = [
    Student("Enes", "Kamış", 70),
    Student("Ayşe", "Sucu", 49),
    Student("İrem", "Yılmaz", 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(karsilamaMesaji),
        ),
        body: buildBody(context));
  }



  String mesajGoster(BuildContext context, String sonuc) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(sonuc),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(students[index].photoLink),
              ),
              title: Text(
                  students[index].firstName + " " + students[index].lastName),
              subtitle: Text("Sınavdan Aldığı Not: " +
                  students[index].grade.toString() +
                  " [" +
                  students[index].getStatus +
                  " ]"),
              trailing: buildStatusIcon(students[index].grade),
              onTap: () {
                setState(() {
                  selectedStudent = students[index];
                });
                print(selectedStudent);
              },
            );
          },
        )),
        Text("Seçili Öğrenci: " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:RaisedButton(
                color: Colors.deepOrangeAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5.0),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  onPressed: () {
                    String sonuc = "Yeni Öğrenci Eklendi";
                    mesajGoster(context, sonuc);
                  },
                ),
              ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:RaisedButton(
                color: Colors.amber,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  String sonuc = "Öğrenci Güncellendi";
                  mesajGoster(context, sonuc);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:RaisedButton(
                color: Colors.blue,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  String sonuc = selectedStudent.firstName+" İsimli Öğrenci Başarıyla Silindi";
                  mesajGoster(context, sonuc);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40 && grade <= 49) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
