abstract class ListViewChild {}

class ListViewItem<T> extends ListViewChild {
  ListViewItem({required this.data});

  final T data;
}

class ListViewSeparator extends ListViewChild {
  ListViewSeparator({this.height = 16});

  final double height;
}
