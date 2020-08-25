import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting_visulalization/sotring_algorithms/bubble_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/insertion_sort.dart';
import 'package:sorting_visulalization/main_body.dart';
import 'package:sorting_visulalization/sotring_algorithms/quick_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/merge_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/selection_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/cocktail_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/comb_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/cycle_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/gnome_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/heap_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/oddeven_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/pigeonhole_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/shell_sort.dart';
import 'package:sorting_visulalization/sotring_algorithms/stooge_sort.dart';

import 'package:sorting_visulalization/algorithm_list.dart';
import 'package:sorting_visulalization/plot_list.dart';

StreamController<List<int>> streamController = StreamController();
List<int> numbers = [];
List<String> fastAlgos = ["quick", "merge", "shell", "heap", "comb", "cycle"];
List<String> slowAlgos = [
  "insertion",
  "selection",
  "bubble",
  "cocktail",
  "gnome",
  "stooge",
  "oddeven"
];
var screen_width, screen_height;
String currentSortAlgo = 'quick';
String currentPlotStyle = 'bar';
double sampleSize = 320;
bool isSorted = false;
bool isSorting = false;
int speed = 0;
int duration = 1500;
var toss = 0;
int max_len = 700;
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
      numbers.add(Random().nextInt(max_len));
    }
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
      numbers.add(Random().nextInt(max_len));
    }
    streamController.add(numbers);
  }

  setSortAlgo(String type) {
    setState(() {
      currentSortAlgo = type;
      toss = Random().nextInt(3);
    });
  }

  setPlotStyle(String type) {
    setState(() {
      currentPlotStyle = type;
      toss = Random().nextInt(3);
    });
  }

  checkAndResetIfSorted() async {
    if (isSorted) {
      reset();
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  changeSpeed() {
    if (speed > 0) {
      speed = 0;
      duration = 1500;
    } else {
      speed++;
      duration = duration ~/ 2;
    }
    print(speed.toString() + " " + duration.toString());
    setState(() {});
  }

  changeSpeed2x() {
    if (speed == 0) changeSpeed();
  }

  changeSpeed1x() {
    if (speed == 1) changeSpeed();
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
      case "insertion":
        await insertionSort();
        break;
      case "selection":
        await selectionSort();
        break;
      case "quick":
        await quickSort(0, sampleSize.toInt());
        break;
      case "merge":
        await mergeSort(0, sampleSize.toInt());
        break;
      case "stooge":
        await stoogesort(0, sampleSize.toInt());
        break;
      case "shell":
        await shellSort();
        break;
      case "pigeonhole":
        await pigeonHole();
        break;
      case "oddeven":
        await oddEvenSort();
        break;
      case "heap":
        await heapSort();
        break;
      case "gnome":
        await gnomeSort();
        break;
      case "cycle":
        await cycleSort();
        break;
      case "comb":
        await combSort();
        break;
      case "cocktail":
        await cocktailSort();
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
                    dropdownColor: Color(0xFF011638),
                    value: currentSortAlgo,
                    items: algo_list,
                    onChanged: (String value) {
                      reset();
                      setSortAlgo(value);
                      if (fastAlgos.contains(value)) changeSpeed1x();
                      if (slowAlgos.contains(value)) changeSpeed2x();
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
                    dropdownColor: Color(0xFF011638),
                    value: currentPlotStyle,
                    items: plot_list,
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
