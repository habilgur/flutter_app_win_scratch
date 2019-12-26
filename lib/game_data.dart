import 'dart:math';

import 'package:flutter/material.dart';

class GameData extends ChangeNotifier {
  AssetImage circleImage = AssetImage("images/circle.png");
  AssetImage rupeeImage = AssetImage("images/rupee.png");
  AssetImage sadFaceImage = AssetImage("images/sadFace.png");
  int _luckyNum;

  List<AssetImage> imageList =
      List.generate(25, (index) => AssetImage("images/circle.png"));

  setLuckyNumber() {
    _luckyNum = Random().nextInt(imageList.length);
  }

  get luckyNum => _luckyNum;

  checkImage(int index) {
    if (index == luckyNum)
      imageList[index] = AssetImage("images/rupee.png");
    else
      imageList[index] = AssetImage("images/sadFace.png");

    notifyListeners();
  }

  resetGame() {
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
