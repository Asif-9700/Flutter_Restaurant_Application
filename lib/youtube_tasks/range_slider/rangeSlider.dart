import 'package:flutter/material.dart';

class RangeSliderCode extends StatefulWidget {
  const RangeSliderCode({super.key});

  @override
  State<RangeSliderCode> createState() => _RangeSliderCodeState();
}

class _RangeSliderCodeState extends State<RangeSliderCode> {
  RangeValues values = RangeValues(0, 1);
  @override
  Widget build(BuildContext context) {
    //range lables build ke andar bcoz baar baar update karwana padega slider
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    return Scaffold(
      body: Center(
        child: RangeSlider(
          values: values,
          labels: labels,
          //divisions means numbers on slider
          divisions: 10,
          //color change
          activeColor: Colors.green,
          inactiveColor: Colors.green.shade200,
          onChanged: (newValue) {
            //values update
            values = newValue;
            setState(() {});
          },
        ),
      ),
    );
  }
}
