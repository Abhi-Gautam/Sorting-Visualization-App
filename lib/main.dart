import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting_visulalization/sotring_algorithms/bubble_sort.dart';
import 'package:sorting_visulalization/main_body.dart';

StreamController<List<int>> streamController = StreamController();
List<int> numbers = [];
List<int> colors = [];
var width, height;
String currentSortAlgo = 'bubble';
String currentPlotStyle = 'bar';
double sampleSize = 320;
bool isSorted = false;
bool isSorting = false;
int speed = 0;
int duration = 1500;
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
Duration getDuration() {
  return Duration(microseconds: duration);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF2e294e),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sampleSize = MediaQuery.of(context).size.width / 2;
    for (int i = 0; i < sampleSize; ++i) {
      numbers.add(Random().nextInt(500));
      colors.add(0);
    }
    print(numbers.length);
    setState(() {});
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  reset() {
    isSorted = false;
    numbers = [];
    for (int i = 0; i < sampleSize; ++i) {
      numbers.add(Random().nextInt(500));
      colors.add(0);
    }
    streamController.add(numbers);
  }

  setSortAlgo(String type) {
    setState(() {
      currentSortAlgo = type;
    });
  }

  setPlotStyle(String type) {
    setState(() {
      currentPlotStyle = type;
    });
  }

  checkAndResetIfSorted() async {
    if (isSorted) {
      reset();
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  String getTitle() {
    switch (currentSortAlgo) {
      case "bubble":
        return "Bubble Sort";
        break;
    }
    return "done";
  }

  changeSpeed() {
    if (speed >= 3) {
      speed = 0;
      duration = 1500;
    } else {
      speed++;
      duration = duration ~/ 2;
    }

    print(speed.toString() + " " + duration.toString());
    setState(() {});
  }

  sort() async {
    setState(() {
      isSorting = true;
    });

    await checkAndResetIfSorted();

    Stopwatch stopwatch = new Stopwatch()..start();

    switch (currentSortAlgo) {
      case "bubble":
        await bubbleSort();
        break;
    }

    stopwatch.stop();

    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Sorting completed in ${stopwatch.elapsed.inMilliseconds} ms.",
        ),
      ),
    );
    setState(() {
      isSorting = false;
      isSorted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconSize: 30,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    focusColor: Color(0xFF011638),
                    value: currentSortAlgo,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Bubble Sort",
                        ),
                        value: 'bubble',
                      ),
                    ],
                    onChanged: (String value) {
                      reset();
                      setSortAlgo(value);
                    },
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconSize: 30,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    focusColor: Color(0xFF011638),
                    value: currentPlotStyle,
                    items: [
                      DropdownMenuItem(
                        child: Text("Bars"),
                        value: 'bar',
                      ),
                      DropdownMenuItem(
                        child: Text("Dots"),
                        value: 'dot',
                      )
                    ],
                    onChanged: (String value) {
                      reset();
                      setPlotStyle(value);
                    },
                  ),
                )
              ],
            )),
            Container(
              child: MainBody(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF011638),
        child: Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    onPressed: isSorting
                        ? null
                        : () {
                            reset();
                            setSortAlgo(currentSortAlgo);
                          },
                    child: Text(
                      "RESET",
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(
                child: FlatButton(
                    padding: EdgeInsets.all(18),
                    onPressed: isSorting ? null : sort,
                    child: Text("SORT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))),
            Expanded(
                child: FlatButton(
                    onPressed: isSorting ? null : changeSpeed,
                    child: Text(
                      "${speed + 1}x",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }
}
