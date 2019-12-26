import 'dart:math';

import 'package:flutter/material.dart';

class GameData extends ChangeNotifier {
  AssetImage circleImage = AssetImage("images/circle.png");
  AssetImage rupeeImage = AssetImage("images/rupee.png");
  AssetImage sadFaceImage = AssetImage("images/sadFace.png");
  int _luckyNum;
  int _userRight = 5;
  bool _isGameWon = false;

  get luckyNum => _luckyNum;
  get isGameWon => _isGameWon;
  get userRights => _userRight;

  List<AssetImage> imageList =
      List.generate(25, (index) => AssetImage("images/circle.png"));

  setLuckyNumber() {
    _luckyNum = Random().nextInt(imageList.length);
  }

  checkImage(int index) {
    if (userRights == 0) return;
    if (index == luckyNum) {
      imageList[index] = AssetImage("images/rupee.png");
      _isGameWon = true;
    } else {
      imageList[index] = AssetImage("images/sadFace.png");
      _userRight--;
    }
    notifyListeners();
  }

  resetGame() {
    _isGameWon = false;
    _userRight = 5;
    imageList = List.generate(25, (index) => AssetImage("images/circle.png"));
    setLuckyNumber();
    notifyListeners();
  }

  showAll() {
    imageList = List.generate(
        imageList.length,
        (index) => index == luckyNum
            ? AssetImage("images/rupee.png")
            : AssetImage("images/sadFace.png"));
    notifyListeners();
  }
}
