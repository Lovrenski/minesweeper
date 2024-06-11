import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minesweeper/bomb.dart';
import 'package:minesweeper/numberbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables
  int numberOfSquare = 9 * 9;
  int numberInEachRow = 9;

  // Number of bombs around
  var squareStatus = [];

  // Bombs location
  final List<int> bombLocation = [];

  @override
  void initState() {
    for (int i = 0; i < numberOfSquare; i++) {
      squareStatus.add([0, false]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          // Game Stats
          Container(
            height: 150,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Bombs
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '6',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text('B O M B'),
                  ],
                ),

                // Refresh
                Card(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40,
                  ),
                  color: Colors.grey[700],
                ),

                // Timer
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text('T I M E'),
                  ],
                ),
              ],
            ),
          ),

          // Grid
          Expanded(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquare,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInEachRow),
                itemBuilder: (context, index) {
                  if (bombLocation.contains(index)) {
                    return MyBomb(
                      child: index,
                    );
                  } else {
                    return MyNumberBox(
                      child: index,
                      revealed: squareStatus[index][1],
                    );
                  }
                }),
          ),

          // Brand
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Text('C R E A T E D B Y W H I T E'),
          ),
        ],
      ),
    );
  }
}
