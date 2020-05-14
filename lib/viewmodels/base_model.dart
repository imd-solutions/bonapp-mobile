import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  int _currnentPage;

  ViewState get state => _state;
  int get currentPage => _currnentPage;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
  void setCurrentPage(int index) {
    _currnentPage = index;
    notifyListeners();
  }
}