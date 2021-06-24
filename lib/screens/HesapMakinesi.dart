import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  @override
  State createState() => new HesapMakinesiState();
}

class HesapMakinesiState extends State<HesapMakinesi> {
  var num1 = 0, num2 = 0, sum = 0;

  TextEditingController t1 = new TextEditingController(text: "0");
  TextEditingController t2 = new TextEditingController(text: "0");

  void toplama() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void cikarma() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  //çarpma yapan fonksiyon
  void carpma() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void bolme() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  void sil() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text("Hesap Makinesi", style: TextStyle(color: Colors.deepOrange)),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "SONUÇ : $sum",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Birinci sayıyı girin"),
              controller: t1,
            ),
            TextField(
              //kullanıcıdan 2.sayıyı alıyoruz.
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "İkinci sayıyı girin"),
              controller: t2,
            ),
            //girilen degerlerle butonlar arasına boşluk ekliyoruz.
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            Row(
              //buraya satır koyarak toplama ve çıkarma işlemlerinin oldugu butonları koyuyoruz.
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  elevation: 20,
                  highlightColor: Colors.deepOrange,
                  child: new Text("+"),
                  color: Colors.lightBlue,
                  //basıldıgında toplama fonksiyonuna gidip orada işlemleri yapıyor.
                  onPressed: toplama,
                ),
                new RaisedButton(
                  highlightColor: Colors.deepOrange,
                  elevation: 20,
                  child: new Text("-"),
                  color: Colors.lightBlue,
                  //basıldıgında cikarma fonksiyonuna gidip orada işlemleri yapıyor.
                  onPressed: cikarma,
                ),
              ],
            ),
            new Row(
              //yeni bir satır açarak silme butonunu yerleştirdim.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  highlightColor: Colors.deepOrange,
                  elevation: 20,
                  child: new Text("Temizle"),
                  color: Colors.lightBlue,
                  //basıldıgında sil fonksiyonuna gidip orada işlemleri yapıyor.
                  onPressed: sil,
                ),
              ],
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  elevation: 20,
                  highlightColor: Colors.deepOrange,
                  child: new Text("*"),
                  color: Colors.lightBlue,
                  //basıldıgında carpma fonksiyonuna gidip orada işlemleri yapıyor.
                  onPressed: carpma,
                ),
                new RaisedButton(
                  elevation: 20,
                  highlightColor: Colors.deepOrange,
                  child: new Text("/"),
                  color: Colors.lightBlue,
                  //basıldıgında bolme fonksiyonuna gidip orada işlemleri yapıyor.
                  onPressed: bolme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
