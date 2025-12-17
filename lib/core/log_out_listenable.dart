import 'package:flutter/material.dart';

class LogoutListenable extends ChangeNotifier {
  LogoutListenable(Stream<String> stream) {
    stream.listen((event) {
      if (event == 'logout') {
        notifyListeners();
      }
    });
  }
}
