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
            BackButton(),
            //사용자 알람 아이콘
            AskInformation(),
            RegisterButton(),
          ],
        ),
      ),
    );
  }
}

//뒤로가기 버튼
class BackButton extends StatelessWidget{
  const BackButton({super.key});

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
class AskInformation extends StatelessWidget{
  const AskInformation({super.key});

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
class RegisterButton extends StatelessWidget{
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: (){
        context.push('/user/register');
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
class LoginButton extends StatelessWidget{
  const LoginButton({super.key});

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