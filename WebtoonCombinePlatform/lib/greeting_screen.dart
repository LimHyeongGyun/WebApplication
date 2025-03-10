import 'package:flutter/material.dart';

import 'main.dart';

class GreetingScreen extends StatelessWidget{
  const GreetingScreen({super.key});

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0b0d18),
          title: Container(
            height: 56, width: widthAxis,
            color: Color(0xFF0b0d18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Title로고가 들어갈 곳
                Text(
                  'Greeting',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                //사용자 알람 아이콘
                MyNotification(),
              ],
            ),
          ),
          centerTitle: true,
        ),
    );
  }
}