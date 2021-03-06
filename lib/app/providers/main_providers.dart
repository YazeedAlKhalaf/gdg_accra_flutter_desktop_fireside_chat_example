import 'package:flutter_riverpod/flutter_riverpod.dart';

final drawerIndexProvider =
    StateNotifierProvider<DrawerIndexProvider, int>((ref) {
  return DrawerIndexProvider();
});

class DrawerIndexProvider extends StateNotifier<int> {
  DrawerIndexProvider() : super(0);

  void setIndex(int newIndex) {
    state = newIndex;
  }
}
