import 'dart:async';
import 'package:sorting_visulalization/main.dart';

cf(int a, int b) {
  if (a < b) {
    return -1;
  } else if (a > b) {
    return 1;
  } else {
    return 0;
  }
}

quickSort(int leftIndex, int rightIndex) async {
  Future<int> partition(int left, int right) async {
    int p = (left + (right - left) / 2).toInt();

    var temp = numbers[p];
    numbers[p] = numbers[right];
    numbers[right] = temp;
    await Future.delayed(getDuration(), () {});

    streamController.add(numbers);

    int cursor = left;

    for (int i = left; i < right; i++) {
      if (cf(numbers[i], numbers[right]) <= 0) {
        var temp = numbers[i];
        numbers[i] = numbers[cursor];
        numbers[cursor] = temp;
        cursor++;

        await Future.delayed(getDuration(), () {});

        streamController.add(numbers);
      }
    }

    temp = numbers[right];
    numbers[right] = numbers[cursor];
    numbers[cursor] = temp;

    await Future.delayed(getDuration(), () {});

    streamController.add(numbers);

    return cursor;
  }

  if (leftIndex < rightIndex) {
    int p = await partition(leftIndex, rightIndex);

    await quickSort(leftIndex, p - 1);

    await quickSort(p + 1, rightIndex);
  }
}
