extension IterableExt<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T item) convert) sync* {
    var index = 0;
    for (final item in this) {
      yield convert(index++, item);
    }
  }
}
