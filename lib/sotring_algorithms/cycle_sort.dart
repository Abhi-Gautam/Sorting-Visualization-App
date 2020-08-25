import 'dart:async';
import 'package:sorting_visulalization/main.dart';

cycleSort() async {
  int writes = 0;
  for (int cycleStart = 0; cycleStart <= numbers.length - 2; cycleStart++) {
    int item = numbers[cycleStart];
    int pos = cycleStart;
    for (int i = cycleStart + 1; i < numbers.length; i++) {
      if (numbers[i] < item) pos++;
    }

    if (pos == cycleStart) {
      continue;
    }

    while (item == numbers[pos]) {
      pos += 1;
    }

    if (pos != cycleStart) {
      int temp = item;
      item = numbers[pos];
      numbers[pos] = temp;
      writes++;
    }

    while (pos != cycleStart) {
      pos = cycleStart;
      for (int i = cycleStart + 1; i < numbers.length; i++) {
        if (numbers[i] < item) pos += 1;
      }

      while (item == numbers[pos]) {
        pos += 1;
      }

      if (item != numbers[pos]) {
        int temp = item;
        item = numbers[pos];
        numbers[pos] = temp;
        writes++;
      }
      await Future.delayed(getDuration());
      streamController.add(numbers);
    }
  }
}
