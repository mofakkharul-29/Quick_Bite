import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavState extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void onItemTap(int index) {
    state = index;
  }
}
