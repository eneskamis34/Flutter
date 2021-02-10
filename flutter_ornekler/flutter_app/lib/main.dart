import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp())); //materialApp
}

class MyApp extends StatelessWidget {
  String karsilamaMesaji = "Uygulama Adı Kısmı";
  String mesaj = "Gövde Kısmı";
  String sonuc = "";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Enes Kamış","Fatma","Ayşe","Sultan","İrem"];
    return Scaffold(
      appBar: AppBar(
        title: Text(karsilamaMesaji),
      ),
      body: Column(
        children:<Widget> [
          Expanded(
            child:ListView.builder(
              itemCount: ogrenciler.length,
              itemBuilder: (BuildContext context, int index){
                return Text(ogrenciler[index]);
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
      ),
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
}
