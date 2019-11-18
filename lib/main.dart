import 'package:flutter/material.dart';
import 'ui/planet_weight_form.dart';
void main(){
  runApp(PlanetWeight());
}

class PlanetWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Mein Gewicht auf Planet X";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800] ,
        ),
        backgroundColor: Colors.blueGrey,
        body: PlanetWeightForm(),
      )
    );
  }
}
