import 'dart:async';
import 'package:sorting_visulalization/main.dart';

shellSort() async {
  for (int gap = numbers.length ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < numbers.length; i += 1) {
      int temp = numbers[i];
      int j;
      for (j = i; j >= gap && numbers[j - gap] > temp; j -= gap)
        numbers[j] = numbers[j - gap];
      numbers[j] = temp;
      await Future.delayed(getDuration());
      streamController.add(numbers);
    }
  }
}
