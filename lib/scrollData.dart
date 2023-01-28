import 'dart:ui';

class ScrollData {
  ScrollData();

  double _scrollPos = 0;
  double _scrollPercentage = 0;
  Size? _size;

  double get scrollPos => _scrollPos;
  double get scrollPercentage => _scrollPercentage;

  set size(Size sz) => _size ??= sz;
  void setScrollPos(double value) {
    if (_size == null) {
      return;
    }
    _scrollPos = value;
    _scrollPercentage = _scrollPos / _size!.height;
  }

  double percentageToHeight(double percentage) {
    if (_size == null) {
      return 0;
    }
    return percentage * _size!.height;
  }
}

final ScrollData scrollData = ScrollData();
