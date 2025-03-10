import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';
import 'AppLayout.dart';
class GreetingScreen extends StatelessWidget{
  const GreetingScreen({super.key});

  Widget build(BuildContext context){
    return UILayout(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF0b0d18)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //뒤로가기 버튼
            backButton(),
            //사용자 알람 아이콘
            askInformation(),
          ],
        ),
      ),
    );
  }
}

//뒤로가기 버튼
class backButton extends StatelessWidget{
  const backButton({super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
       children: [
         Icon(
           Icons.arrow_back,
           color: Color(0xFFd3d3d3),
           size: 30,
         ),
       ],
      )
    );
  }
}
//문의하기 버튼
class askInformation extends StatelessWidget{
  const askInformation({super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){
        context.push('');
      },
      child: Text(
        '문의하기',
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}
//회원가입 버튼
class registerButton extends StatelessWidget{
  const registerButton({super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){
        context.push('');
      },
      child: Text(
        '이메일 회원가입',
        style: TextStyle(
          color: Colors.white
        ),
      )
    );
  }
}
//로그인 버튼
class loginButton extends StatelessWidget{
  const loginButton({super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
        onPressed: (){
          context.push('');
        },
        child: Text(
          '이메일 로그인',
          style: TextStyle(
              color: Colors.white
          ),
        )
    );
  }
}