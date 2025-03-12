import 'package:flutter/material.dart';

import 'main.dart';
import 'register_screen.dart';

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

class RegisterUILayout extends StatelessWidget{
  const RegisterUILayout({super.key, required this.child, required this.onNextPressed, required this.progress});

  final Widget child; //각 페이지의 내용 전달
  final VoidCallback onNextPressed; //Next버튼에 전달할 콜백
  final double progress; //진행률 값

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      color: Color(0xff101322),
      child: Column(
        children: [
          Expanded(child: child), //화면의 나머지 영역 차지
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                color: Color(0xff101322),
                width: widthAxis,
                height: 60,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NextButton(onPressed: onNextPressed),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}