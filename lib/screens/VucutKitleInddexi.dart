import 'package:flutter/material.dart';

class VucutKitleIndeksi extends StatefulWidget {
  @override
  _VucutKitleIndeksiState createState() => _VucutKitleIndeksiState();
}

class _VucutKitleIndeksiState extends State<VucutKitleIndeksi> {
  double boy, kilo, hesaplama;
  var _formKey = GlobalKey<FormState>();
  String sonuc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vücut Kitle İndeksi"),
        backgroundColor: Color(0xFF97857C),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  margin: EdgeInsets.all(25),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => validateSayi(value),
                    onSaved: (value) => boy = double.parse(value) / 100,
                    decoration: InputDecoration(
                      labelText: "cm cinsinden boy giriniz:",
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  margin: EdgeInsets.all(25),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => validateSayi(value),
                    onSaved: (value) => kilo = double.parse(value),
                    decoration: InputDecoration(
                      labelText: "kg cinsinden kilo giriniz:",
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("ÖLÇÜM"),
                  color: Color(0xFFFC3C3C),
                  highlightColor: Color(0xFF00A388),
                  elevation: 20,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("$boy $kilo");
                      setState(() {
                        vkiHesapla();
                      });
                    }
                  },
                ),
                hesaplama != null
                    ? Text(
                  "Vücut Kitle İndeksi: $hesaplama",
                  style: TextStyle(fontSize: 24),
                )
                    : Text(
                  "Lütfen değer Giriniz",
                  style: TextStyle(fontSize: 24),
                ),
                sonuc != null
                    ? Text(
                  "$sonuc",
                  style: TextStyle(fontSize: 24),
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void vkiHesapla() {
    hesaplama = kilo / (boy * boy);
    hesaplama = double.parse(hesaplama.toStringAsFixed(2));

    if (hesaplama < 18.5) {
      sonuc = "Zayıf ";
    } else if (18.5 <= hesaplama && hesaplama < 25) {
      sonuc = "Normal Kilolu";
    } else if (25 <= hesaplama && hesaplama < 30) {
      sonuc = "Fazla Kilolu";
    } else if (30 <=hesaplama && hesaplama < 35) {
      sonuc = "1. Derece Obezite";
    } else if (35 <= hesaplama && hesaplama < 40) {
      sonuc = "2. Derece Obezite";
    } else if (40 <= hesaplama && hesaplama < 50) {
      sonuc = "3. Derece Obezite";
    } else if (50 <= hesaplama && hesaplama < 60) {
      sonuc = "  Aşırı Obezite";
    }else if (hesaplama > 60) {
      sonuc = " Aşırı Obezite";
    }
    else {
      sonuc = "hata!";
    }
  }

  validateSayi(String value) {
    if (value.length < 1) return 'Geçersiz';
    try {
      double.parse(value);
    } catch (e) {
      return "Geçersiz";
    }
  }
}