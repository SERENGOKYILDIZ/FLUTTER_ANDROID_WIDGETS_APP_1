import 'package:flutter/material.dart';

class sonucEkrani extends StatefulWidget {
  bool sonuc;

  sonucEkrani({required this.sonuc});

  @override
  State<sonucEkrani> createState() => _sonucEkraniState();
}

class _sonucEkraniState extends State<sonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                child: widget.sonuc ? Image.asset("images/happy.png") : Image.asset("images/sad.png")
            ),
            Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 24
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TEKRAR DENE"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){
                    Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
