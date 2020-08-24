import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> algo_list = [
  DropdownMenuItem(
    child: Text(
      "Bubble Sort",
    ),
    value: 'bubble',
  ),
  DropdownMenuItem(
    child: Text(
      "Insertion Sort",
    ),
    value: 'insertion',
  ),
  DropdownMenuItem(
    child: Text(
      "Selection Sort",
    ),
    value: 'selection',
  ),
  DropdownMenuItem(
    child: Text(
      "Quick Sort",
    ),
    value: 'quick',
  ),
  DropdownMenuItem(
    child: Text(
      "Merge Sort",
    ),
    value: 'merge',
  ),
];
