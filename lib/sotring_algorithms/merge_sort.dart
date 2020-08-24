import 'dart:async';
import 'package:sorting_visulalization/main.dart';

mergeSort(int leftIndex, int rightIndex) async {
  Future<void> merge(int leftIndex, int middleIndex, int rightIndex) async {
    int leftSize = middleIndex - leftIndex + 1;
    int rightSize = rightIndex - middleIndex;

    List leftList = new List(leftSize);
    List rightList = new List(rightSize);

    for (int i = 0; i < leftSize; i++) leftList[i] = numbers[leftIndex + i];
    for (int j = 0; j < rightSize; j++)
      rightList[j] = numbers[middleIndex + j + 1];

    int i = 0, j = 0;
    int k = leftIndex;

    while (i < leftSize && j < rightSize) {
      if (leftList[i] <= rightList[j]) {
        numbers[k] = leftList[i];
        i++;
      } else {
        numbers[k] = rightList[j];
        j++;
      }

      await Future.delayed(getDuration(), () {});
      streamController.add(numbers);

      k++;
    }

    while (i < leftSize) {
      numbers[k] = leftList[i];
      i++;
      k++;

      await Future.delayed(getDuration(), () {});
      streamController.add(numbers);
    }

    while (j < rightSize) {
      numbers[k] = rightList[j];
      j++;
      k++;

      await Future.delayed(getDuration(), () {});
      streamController.add(numbers);
    }
  }

  if (leftIndex < rightIndex) {
    int middleIndex = (rightIndex + leftIndex) ~/ 2;

    await mergeSort(leftIndex, middleIndex);
    await mergeSort(middleIndex + 1, rightIndex);

    await Future.delayed(getDuration(), () {});

    streamController.add(numbers);

    await merge(leftIndex, middleIndex, rightIndex);
  }
}
