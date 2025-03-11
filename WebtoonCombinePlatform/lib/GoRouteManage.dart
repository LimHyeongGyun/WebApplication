import 'package:go_router/go_router.dart';

import 'main.dart'; //main스크린
import 'greeting_screen.dart';//greeting스크린
import 'register_screen.dart'; //회원가입 화면

final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      //페이지 메인홈
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      //유저 회원가입 및 로그인 안내 페이지로 라우팅
      GoRoute(
        path: '/user/greetings',
        builder: (context, state) => GreetingScreen(),
      ),
      //회원가입 페이지로 라우팅
      GoRoute(
        path: '/user/register',
        builder: (context, state) => RegisterScreen(),
      ),
      //이메일 로그인 페이지로 라우팅
      /*GoRoute(
        path: '/user/login',
      )*/
    ]
);