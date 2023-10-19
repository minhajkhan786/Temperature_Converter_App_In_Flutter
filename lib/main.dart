import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double inputTemperature = 0.0;
  double convertedTemperature = 0.0;
  String inputUnit = 'Celsius';
  String outputUnit = 'Fahrenheit';

  void convertTemperature() {
    setState(() {
      if (inputUnit == 'Celsius' && outputUnit == 'Fahrenheit') {
        convertedTemperature = (inputTemperature * 9 / 5) + 32;
      } else if (inputUnit == 'Fahrenheit' && outputUnit == 'Celsius') {
        convertedTemperature = (inputTemperature - 32) * 5 / 9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Input Temperature',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputTemperature = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            DropdownButton<String>(
              value: inputUnit,
              items: <String>['Celsius', 'Fahrenheit'].map((String ?value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value??''),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  inputUnit = value ?? 'Celsius';
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                convertTemperature();
              },
              child: Text('Convert'),
            ),
            Text(
              'Converted Temperature',
              style: TextStyle(fontSize: 18),
            ),
            Text('$convertedTemperature $outputUnit', style: TextStyle(fontSize: 24)),
            DropdownButton<String>(
              value: outputUnit,
              items: <String>['Celsius', 'Fahrenheit'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String ? value) {
                setState(() {
                  outputUnit = value?? 'Fahrenheit';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TemperatureConverter(),
  ));
}
