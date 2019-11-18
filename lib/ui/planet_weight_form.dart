import 'package:flutter/material.dart';

class PlanetWeightForm extends StatefulWidget {
  @override
  _PlanetWeightFormState createState() => _PlanetWeightFormState();
}

class _PlanetWeightFormState extends State<PlanetWeightForm> {
  /*
  *     Mercury: 0.38
    Venus: 0.91
    Earth: 1.00
    Mars: 0.38
    Jupiter: 2.34
    Saturn: 1.06
    Uranus: 0.92
    Neptune: 1.19
    Pluto: 0.06
    weight = mass * multiplier (surface gravity)
  *
  * */

  final TextEditingController _weightController = TextEditingController();
  // initialize radio group value
  int radioValue = 0;
  // initialize calculation result
  double _finalResult = 0.0;
  String _formattedText = "";
  // handle radio buttons onChanged
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
      // switch statement
      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Dein Gewicht auf dem Planet Mars ist: ${_finalResult.toStringAsFixed(1)} kg";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Dein Gewicht auf dem Planet Pluto ist: ${_finalResult.toStringAsFixed(1)} kg";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Dein Gewicht auf dem Planet Venus ist: ${_finalResult.toStringAsFixed(1)} kg";
          break;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        padding: const EdgeInsets.all(2.5),
        children: <Widget>[
          Image.asset('images/planet.png',
            height: 133.0,
            width : 200.0,
          ),
        Container(
          margin: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Dein Gewicht auf dem Planet Erde',
                    hintText: 'Gewicht in kg eingeben z.b. 75',
                    icon: Icon(Icons.person_outline),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )
                  ),
                ),
              ),
              // add three radio buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                      activeColor: Colors.red,
                      value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                  Text("Mars",
                    style: TextStyle(color: Colors.white),),
                  Radio<int>(
                      activeColor: Colors.brown,
                      value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                  Text("Pluto",
                    style: TextStyle(color: Colors.white),),
                  Radio<int>(
                      activeColor: Colors.yellow,
                      value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                  Text("Venus",
                    style: TextStyle(color: Colors.white),),

                ],
              ),
              // result text
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                      _weightController.text.isEmpty ? "Bitte Gewicht eingeben" : _formattedText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w400,

                    )
                  ),
                ),
              )

            ]

          ),
        ),
        ],
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {

    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    } else {
      print("Somethings wrong");

      return int.parse("180") * 0.38;
    }
  }
}
