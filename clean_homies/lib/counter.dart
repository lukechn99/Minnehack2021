import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';

class GermCounter extends StatefulWidget {
  const GermCounter({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GermCounterState();
  }
}

class GermCounterState extends State<GermCounter> {
  double _counter = 50000;
  double _percent = 0;
  Color progress = Colors.red;

  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => _germCounter());
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _washedHands() {
    setState(() {
      _counter = 50000;
      _percent = 0;
    });
  }

  void _germCounter() {
    setState(() {
      _counter *= 1.00347;
      _percent = _counter / 5000000;
      if (_percent < 0.25) {
        progress = Colors.green;
      } else if (_percent < 0.5) {
        progress = Colors.yellow;
      } else if (_percent < 0.75) {
        progress = Colors.orange;
      } else {
        if (_percent > 1) {
          _percent = 1;
        }
        progress = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 13.0,
            animation: true,
            percent: _percent,
            center: new Text(
              _counter.toInt().toString() + " germs",
              style:
              new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: progress,
          ),
          ElevatedButton(
            child: Text('Washed Hands!'),
            onPressed: () {
              _washedHands();
            },
          )
        ]
      )
    );
  }
}