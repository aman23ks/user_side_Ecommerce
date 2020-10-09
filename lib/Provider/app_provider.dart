import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  bool isLoading = false;

  void changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
