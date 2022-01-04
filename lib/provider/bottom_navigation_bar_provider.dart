import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier{
  final GlobalKey<ScaffoldState> keyOfScaffold = GlobalKey();


  
  int currentIndex = 0;
  indexChanger(v){
    currentIndex = v;
    notifyListeners();

  }
}