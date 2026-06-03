import 'package:flutter/material.dart';

class Sum extends StatefulWidget {
  const Sum({super.key});

  @override
  State<Sum> createState() => _SumState();
}

class _SumState extends State<Sum> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: no1Controller,
                style: TextStyle(fontSize: 25),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: no2Controller,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());

                      var sum = no1 + no2;
                      result = "The sum of $no1 and $no2 is : $sum";
                      setState(() {});
                    },
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());

                      var sub = no1 - no2;
                      result = "The sub of $no1 and $no2 is : $sub";
                      setState(() {});
                    },
                    child: Text('Sub'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var mul = no1 * no2;
                      result = "The multiply of $no1 and $no2 is : $mul";
                      setState(() {});
                    },
                    child: Text('Mul'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var div = no1 / no2;
                      result = "The division of $no1 and $no2 is : $div";
                    },
                    child: Text('Div'),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(result, style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
