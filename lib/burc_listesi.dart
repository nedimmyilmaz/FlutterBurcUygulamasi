import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/util//strings.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';

class BurcListesi extends StatelessWidget {
   static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = verileriHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text('Burçlar'),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> verileriHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}" + ".png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}" + ".png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return burcSatiri(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  burcSatiri(BuildContext context, int index) {
    Burc anlikBurc = tumBurclar[index];

    return Card(

        margin: EdgeInsets.all(6),
        color: Colors.blueGrey[800],
        child: SizedBox(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
              leading: Image.asset(
                "images/" + anlikBurc.burcKucukResim,
                width: 79
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 35,
                color: Colors.white,
              ),
              title: Text(
                anlikBurc.burcAdi,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical:6.0),
                child: Text(
                  anlikBurc.burcTarihi,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),

                ),
              ),
            ),
          ),
        ));
  }
}
