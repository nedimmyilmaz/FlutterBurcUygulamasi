import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_listesi.dart';
import 'package:flutter_burc_rehberi/util/strings.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskin;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRenkBul();
  }

  void baskinRenkBul() {
    Future<PaletteGenerator> fPalette = PaletteGenerator.fromImageProvider(
        AssetImage("images/" + secilenBurc.burcKBuyukResim));
    fPalette.then((value) {
      paletteGenerator = value;

      setState(() {
        baskin = paletteGenerator.mutedColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            primary: true,
            backgroundColor: baskin != null ? baskin : Colors.pink.shade100,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/" + secilenBurc.burcKBuyukResim, fit: BoxFit.cover,),
              centerTitle: true,
              title: Text(
                secilenBurc.burcAdi + " Burcunun Özellikleri",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(7),
                child: SingleChildScrollView(
                    child: Text(
                  secilenBurc.burcDetayi,
                  style: TextStyle(
                      fontSize: 27,
                      color: baskin != null ? baskin : Colors.white),
                ))),
          )
        ],
      ),
    );
  }
}
