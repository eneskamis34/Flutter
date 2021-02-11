import 'package:flutter/material.dart';
import 'package:flutter_app/models/Student.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp())); //materialApp
}

class MyApp extends StatelessWidget {
  String karsilamaMesaji = "Öğrenci Takip Sistemi";
  String mesaj = "Gövde Kısmı";
  String sonuc = "";
  List<Student> students = [Student("Enes","Kamış",70),Student("Ayşe","Sucu",49),Student("İrem","Yılmaz",30)];

  //var ogrenciler = ["Enes Kamış","Fatma","Ayşe","Sultan","İrem"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(karsilamaMesaji),
      ),
      body: buildBody(context)
    );
  }
  String puanHesapla(int puan)
  {
    if (puan >= 50) {
      sonuc = "Geçti";
    } else if (puan >= 40 && puan <= 49) {
      sonuc = "Bütünlemeye Kaldı";
    } else {
      sonuc = "Kaldı";
    }
    return sonuc;
  }

  String mesajGoster(BuildContext context,String sonuc)
  {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(sonuc),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children:<Widget> [
        Expanded(
            child:ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(students[index].photoLink),
                  ),
                  title: Text(students[index].firstName+" "+students[index].lastName),
                  subtitle: Text("Sınavdan Aldığı Not: "+ students[index].grade.toString()),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap:(){
                    print(students[index].firstName+" "+students[index].lastName);
                  },
                );
              },
            )
        ),
        Center(
          child: RaisedButton(
            child: Text("Sonucu Gör"),
            onPressed: () {
              String sonuc = puanHesapla(55);
              mesajGoster(context, sonuc);
            },
          ),
        ),
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


