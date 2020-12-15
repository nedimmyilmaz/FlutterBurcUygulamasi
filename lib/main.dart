import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_listesi.dart';
import 'package:flutter_burc_rehberi/burclar_detay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),

      title: "Burç Rehberim",
      themeMode: ThemeMode.dark,
       initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> elemanlar = settings.name.split("/");
        if (elemanlar[1] == "burcDetay") {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(elemanlar[2])));
        }
        return null;
      },

      // home: BurcListesi(),
    );
  }
}
