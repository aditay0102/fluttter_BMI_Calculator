import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _heighcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  double result = 0.0;
  String _finalresult = "";
  String _output = "";

  void _calculateBmi() {
    setState(() {
      int age = int.parse(_agecontroller
          .text); // parse used to get data from string to datatypes

      double height = double.parse(_heighcontroller.text);

      int weight = int.parse(_weightcontroller.text);

      // bmi formula weight / height ^2

      result = weight / (height * height);
      if ((_agecontroller.text.isNotEmpty || age > 0) &&
          ((_heighcontroller.text.isNotEmpty || height > 0) &&
              (_weightcontroller.text.isNotEmpty || weight > 0))) {
        result = weight / (height * height); // our BMI
      } else {
        result = 0.0;
      }

      if (result < 18.5) {
        _output = "Underweight";
      } else if (result <= 24.9) {
        _output = "Healthy Weight";
      } else if (result < 30.0) {
        _output = "Overweight";
      } else {
        _output = "Obesity";
      }

      _finalresult = "Your BMI is: ${result.toStringAsFixed(1)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset('Images/bmi.png'),
              width: 190.0,
              height: 190.0,
            ),
            Container(
              color: Colors.grey,
              width: 290,
              height: 290,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(1.0)),
                  TextField(
                    controller: _agecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text("Enter you Age"),
                        hintText: "e.g 18",
                        icon: Icon(Icons.person_2_outlined)),
                  ),
                  TextField(
                    controller: _heighcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text("Enter your Height in meters"),
                        hintText: "e.g 1.55",
                        icon: Icon(Icons.height)),
                  ),
                  TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text("Enter your Weight in Kg"),
                        hintText: "e.g  84kg",
                        icon: Icon(Icons.height)),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text("Calculate"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: _calculateBmi,
                    ),
                  ),
                  Container(
                    child: Text(
                      " $_finalresult",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      " $_output",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
