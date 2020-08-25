import 'dart:async';
import 'package:sorting_visulalization/main.dart';

pigeonHole() async {
  int min = numbers[0];
  int max = numbers[0];
  int range, i, j, index;
  for (int a = 0; a < numbers.length; a++) {
    if (numbers[a] > max) max = numbers[a];
    if (numbers[a] < min) min = numbers[a];
  }
  range = max - min + 1;
  List<int> phole = new List.generate(range, (i) => 0);

  for (i = 0; i < numbers.length; i++) {
    phole[numbers[i] - min]++;
  }

  index = 0;

  for (j = 0; j < range; j++) {
    while (phole[j]-- > 0) {
      numbers[index++] = j + min;
      await Future.delayed(getDuration());
      streamController.add(numbers);
    }
  }
}
