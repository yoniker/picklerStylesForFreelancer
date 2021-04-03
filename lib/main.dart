import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //sliderTheme: //TODO fill this one such that the last rangeslider looks like the iOS themed slider(the second slider), rather than the android slider
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue= 50.0;
  double _cupertinoValue = 50.0;
  RangeValues _rangeValues = RangeValues(25.0,75.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              value:_sliderValue,
              min:0.0,
              max:100.0,
              onChanged: (newValue){
                setState(() {
                  _sliderValue = newValue;

                });

              },
            ),
            CupertinoSlider(value: _cupertinoValue,min: 0.0,max: 100.0,divisions: 1000, onChanged: (newValue){
              setState(() {
                _cupertinoValue = newValue;
              });
              }),
            RangeSlider(values: _rangeValues,min: 0.0,max:100.0, onChanged:(newRangeSliderValues){
              setState(() {
                _rangeValues = newRangeSliderValues;
              });
            } )
          ],
        ),
      ),
    );
  }
}
