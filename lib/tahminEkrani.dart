import 'dart:math';

import 'package:android_flutter_widgets_app_1/sonucEkrani.dart';
import 'package:flutter/material.dart';

class tahminEkrani extends StatefulWidget {
  const tahminEkrani({super.key});

  @override
  State<tahminEkrani> createState() => _tahminEkraniState();
}

class _tahminEkraniState extends State<tahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();

    rastgeleSayi = Random().nextInt(101); // 0 - 100
    print("Sayımız : ${rastgeleSayi}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak : ${kalanHak}", style: TextStyle(
                color: Colors.pink,
                fontSize: 30
              ),
            ),
            Text("Yardım : ${yonlendirme}", style: TextStyle(
                color: Colors.black54,
                fontSize: 24
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TAHMİN ET"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){
                  setState(() {
                    kalanHak--;
                  });
                  int tahmin = 0;
                  try{
                    tahmin = int.parse(tfTahmin.text);
                  }catch(error){
                    print("Girilen herhangi bir sayı yok : ${error}");
                  }
                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>sonucEkrani(sonuc: true,)));
                    return;
                  }
                  if(tahmin > rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini azalt";
                    });
                  }
                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini arttır";
                    });
                  }
                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>sonucEkrani(sonuc: false,)));
                  }

                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
