import 'dart:async';
import 'package:sorting_visulalization/main.dart';

gnomeSort() async {
  int index = 0;

  while (index < numbers.length) {
    if (index == 0) index++;
    if (numbers[index] >= numbers[index - 1])
      index++;
    else {
      int temp = numbers[index];
      numbers[index] = numbers[index - 1];
      numbers[index - 1] = temp;

      index--;
    }
    await Future.delayed(getDuration());
    streamController.add(numbers);
  }
  return;
}
