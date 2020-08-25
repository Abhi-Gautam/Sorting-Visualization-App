import 'dart:async';
import 'package:sorting_visulalization/main.dart';

heapSort() async {
  for (int i = numbers.length ~/ 2; i >= 0; i--) {
    await heapify(numbers, numbers.length, i);
    streamController.add(numbers);
  }
  for (int i = numbers.length - 1; i >= 0; i--) {
    int temp = numbers[0];
    numbers[0] = numbers[i];
    numbers[i] = temp;
    await heapify(numbers, i, 0);
    streamController.add(numbers);
  }
}

heapify(List<int> arr, int n, int i) async {
  int largest = i;
  int l = 2 * i + 1;
  int r = 2 * i + 2;

  if (l < n && arr[l] > arr[largest]) largest = l;

  if (r < n && arr[r] > arr[largest]) largest = r;

  if (largest != i) {
    int temp = numbers[i];
    numbers[i] = numbers[largest];
    numbers[largest] = temp;
    heapify(arr, n, largest);
  }
  await Future.delayed(getDuration());
}
