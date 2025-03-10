import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'dart:async';
import 'package:go_router/go_router.dart';

import 'AppLayout.dart'; //UI레이아웃
import 'userInformation.dart'; //유저정보
import 'greeting_screen.dart';//greeting스크린 불러오기

double appbarHeight = 56;
double widthAxis = 700;

//go_router 설정
final GoRouter _router = GoRouter(
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
      /*//회원가입 페이지로 라우팅
      GoRoute(
        path: '/user/myPage',
      ),
      GoRoute(
        path: '/user/register',
      ),
      //이메일 로그인 페이지로 라우팅
      GoRoute(
        path: '/user/login',
      )*/
    ]
);

void main() async{
  runApp(MyApp(router: _router));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final GoRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router, //Gorouter 연결
      title: '통합 웹툰 플랫폼 - 레다게임즈',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0b0d18),
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Color(0xFF0b0d18)
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return UILayout(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //자동으로 뒤로가기 버튼을 표시하지않음
          backgroundColor: Color(0xFF0b0d18),
          titleSpacing: 0,
          title: Container(
            height: appbarHeight, width: widthAxis,
            color: Color(0xFF0b0d18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Title로고가 들어갈 곳
                Text(
                  '레다게임즈',
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
        body: Center(
          child: Container(
            width: widthAxis,
            decoration: BoxDecoration(color: Color(0xFF0b0d18)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SearchEngine(),
                      SizedBox(height: 20),
                      //동적 플랫폼 랭크 UI
                      PlatformRank(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//사용자 알람아이콘 버튼 관리
class MyNotification extends StatefulWidget {
  const MyNotification({super.key});


  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  bool hasNotification = true;

  //알림 끄기
  void _onNotificationPressed() {
    setState(() {
      hasNotification = false;
    });
  }
  //해당 링크의 페이지로 이동
  void _launcherURL(){
    final webtoonUrl = 'https://www.naver.com';
    web.window.open(webtoonUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed:() {
            _onNotificationPressed(); //알람의 빨간불이 꺼지게 함
            _launcherURL(); //해당 링크로 이동
          }
        ),
        if(hasNotification)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          )
      ],
    );
  }
}

//검색엔진 버튼 관리
class SearchEngine extends StatelessWidget{
  const SearchEngine({super.key});

  void _launcherURL(){
    final webtoonUrl = 'https://www.naver.com';
    web.window.open(webtoonUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity, //박스 너비
      height: 40, //박스 높이
      //상자모양
      decoration: BoxDecoration(
        color: Color(0xFF25304a),
        borderRadius: BorderRadius.circular(8.0), //모서리 둥글게
      ),
      child: TextButton(
        onPressed: (){
          _launcherURL(); //해당 링크로 이동
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, 40),
          foregroundColor: Color(0xFF25304a), //마우스오버 효과 제거
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(width: 15), //아이콘과 텍스트 사이의 간격
              Text(
                '작품, 인물, 컬렉션, 게시글을 검색해 보세요.',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          )
        )
      ),
    );
  }
}

enum Platform{
  Trend,
  NaverWebtoon,
  KaKaoWebtoon,
  LezhineComics;

  //오버라이드로 한국어 반환
  String get korean{
    switch(this){
      case Platform.Trend:
        return "트렌드";
      case Platform.NaverWebtoon:
        return "네이버웹툰";
      case Platform.KaKaoWebtoon:
        return "카카오웹툰";
      case Platform.LezhineComics:
        return "레진코믹스";
    }
  }
}
//일정 시간 후에 플랫폼이 변동되는 랭크UI
class PlatformRank extends StatefulWidget{
  const PlatformRank({super.key});

  @override
  State<PlatformRank> createState() => _PlatformRankState();
}

class _PlatformRankState extends State<PlatformRank>{

  Platform platform = Platform.NaverWebtoon;
  late String platformName = platform.korean;
  Timer? _timer;

  @override
  void initState(){
    super.initState();
    changePlatformFunction();
  }

  void changePlatformFunction(){
    _timer = Timer.periodic(Duration(seconds: 5), (timer){
      setState(() {
        int nextIndex = (platform.index + 1) % Platform.values.length; //다음 인덱스로 만약 마지막 인덱스면 첫 인덱스로
        platform = Platform.values[nextIndex];
        platformName = platform.korean;
      });
    });
  }

  void _launcherURL(){
    final naverWebtoonUrl = 'https://comic.naver.com/index';
    final kakaoWebtoonUrl = 'https://webtoon.kakao.com/';
    late String webtoonUrl;

    //현재 플랫폼이 네이버 웹툰이면
    if(platform == Platform.NaverWebtoon){
      webtoonUrl = naverWebtoonUrl;
    }
    else if(platform == Platform.KaKaoWebtoon){
      webtoonUrl = kakaoWebtoonUrl;
    }
    
    web.window.open(webtoonUrl); //웹툰 페이지 링크로 이동
  }

  @override
  void dispose(){
    _timer?.cancel(); //위젯이 없어질 때 타이머 정리
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity, //박스 너비
      height: 50, //박스 높이
      //상자모양
      decoration: BoxDecoration(
        color: Color(0xFF25304a),
        borderRadius: BorderRadius.circular(8.0), //모서리 둥글게
      ),
      child: TextButton(
        onPressed: (){
          _launcherURL(); //해당 링크로 이동
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, 50),
          foregroundColor: Color(0xFF25304a), //마우스오버 효과 제거
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '오늘의 \'$platformName\' 랭킹',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 25,
              ),
            ],
          )
        )
      ),
    );
  }
}

class UserPage extends StatelessWidget{
  const UserPage({super.key});

  //페이지 라우팅하기
  void _MoveMyPage(BuildContext context){
    //로그인이 안됐을 때 greetings 페이지로 이동
    //로그인이 됐을 때 로그인 페이지로 이동
    if(login){
      context.push('/user/myPage');
    }
    else if(!login){
      context.push('/user/greetings');
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      width: 140, //박스 너비
      height: 80, //박스 높이
      decoration: BoxDecoration(
        color: Color(0xFF0b0d18),
      ),
      child: TextButton(
          onPressed: (){
            _MoveMyPage(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(100, 50),
            foregroundColor: Color(0xFF0b0d18), //마우스오버 효과 제거
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: Color(0xFFd3d3d3),
                size: 40,
              ),
              SizedBox(height: 0), //아이콘과 텍스트 사이의 간격
              Text(
                '마이페이지',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          )
      ),
    );
  }
}