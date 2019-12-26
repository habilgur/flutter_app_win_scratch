import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_win_scratch/game_data.dart';
import 'package:provider/provider.dart';

class TheBody extends StatefulWidget {
  @override
  _TheBodyState createState() => _TheBodyState();
}

class _TheBodyState extends State<TheBody> {
  int luckNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// listen:false=> Yapılandırma aşamasında notify listenerları kapatılması gerekirse kullanılır.
    Provider.of<GameData>(context, listen: false).setLuckyNumber();
  }

  @override
  Widget build(BuildContext context) {
    var theProvider = Provider.of<GameData>(context);

    print(theProvider.luckyNum);
    return Scaffold(
      appBar: AppBar(
        title: Text("Strach and Win"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: theProvider.imageList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        child: Image(
                          image: theProvider.imageList[index],
                        ),
                        onTap: () => theProvider.checkImage(index),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.pink,
              height: 50,
              child: Text("Show All"),
              onPressed: () => theProvider.showAll(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.pink,
              height: 50,
              child: Text("Reset Game"),
              onPressed: () => theProvider.resetGame(),
            ),
          )
        ],
      ),
    );
  }
}
