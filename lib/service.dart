import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_with_models/user.dart';

class ServiceProviders extends StateNotifier<User> {
  ServiceProviders(super.state);

  int counter = 0;

  void update(
    String n,
    int a,
  ) {
    state = User(name: n, age: a);
  }

// int incrementer() {
//   return state++;
// }
}

class ServiceChangeNotifier extends ChangeNotifier {
  User user = User(name: "", age: 0);

  void update(
    String n,
    int a,
  ) {
    user = User(name: n, age: a);
    notifyListeners();
  }
}
