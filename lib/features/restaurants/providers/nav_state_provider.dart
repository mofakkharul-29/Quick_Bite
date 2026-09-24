import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/restaurants/data/nav_state.dart';

final navStateProvider = NotifierProvider<NavState, int>(() => NavState());
