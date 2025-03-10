import 'package:flutter/material.dart';

import 'main.dart';

class UILayout extends StatelessWidget{
  const UILayout({super.key, required this.child});

  final Widget child; //각 페이지의 내용 전달

  @override
  Widget build(BuildContext context){
    return Container(
      color: Color(0xff101322),
      child: Column(
        children: [
          Expanded(child: child), //화면의 나머지 영역 차지
          SafeArea(
            child: Container(
              color: Color(0xff101322),
              width: widthAxis,
              height: 60,
              alignment: Alignment.center,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly, //간격균등배치
                children: [
                  UserPage(),
                  //UserPage(),UserPage(),UserPage(),UserPage(),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}