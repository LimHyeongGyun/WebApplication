import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';
import 'AppLayout.dart';

//Register페이지 기본 구성화면
class RegisterScreen extends StatefulWidget{
  const RegisterScreen ({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  int _currentIndex = 0; //현재 bodyIndex

  //전환할 Register페이지 목록
  final List<Widget> _pages = [
    ClausesAgreement(), //약관동의
    EnterUseEmail() //이메일 입력
  ];
  //다음 페이지로 이동
  void _nextPage(){
    if(_currentIndex < _pages.length - 1){
      setState(() {
        _currentIndex++;
      });
    }
  }
  //이전 페이지로 이동
  void _prevPage(){
    if(_currentIndex > 0){
      setState(() {
        _currentIndex--;
      });
    }
    else{
      //현재 페이지가 첫번째 이면 greeting으로 돌아가기
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context){
    return RegisterUILayout(
      progress: (_currentIndex + 1) / _pages.length, //진행률 계산
      onNextPressed: _nextPage, //다음페이지를 버튼에 넘겨줌
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //자동으로 뒤로가기 버튼을 표시하지않음
          backgroundColor: Color(0xff101322),
          titleSpacing: 0,
          title: Container(
            height: appbarHeight, width: widthAxis,
            color: Color(0xff101322),
            child: Row(
              children: [
                IconButton(
                  onPressed: _prevPage, //이전 페이지로 이동
                  icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
                ),
                //Text가 들어갈 곳
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child:Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        '이메일 회원가입',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: widthAxis,
            decoration: BoxDecoration(color: Color(0xff101322)
            ),
            child:Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: _pages[_currentIndex], //현재 인덱스에 해당하는 페이지 표시
            ),
          ),
        ),
      ),
    );
  }
}

//약관 동의
class ClausesAgreement extends StatelessWidget{
  const ClausesAgreement ({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '약관동의',
          style: TextStyle(
            fontFamily: 'Bold',
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '가입을 하시려면 다음 정책에 대한\n동의가 필요합니다.',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        ClausesList(),
      ],
    );
  }
}
//약관동의버튼
class ClausesList extends StatefulWidget{
  const ClausesList ({super.key});

  @override
  State<ClausesList> createState() => _ClauseButtons();
}
class _ClauseButtons extends State<ClausesList>{

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 20),
      ],
    );
  }
}
//이메일 주소 입력
class EnterUseEmail extends StatefulWidget{
  const EnterUseEmail({super.key});

  @override
  State<EnterUseEmail> createState() => _EmailInputField();
}
//이메일 InputField
class _EmailInputField extends State<EnterUseEmail>{
  final TextEditingController _controller = TextEditingController();
  late String email;

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '이메일',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 600,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF25304a),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none, //텍스트가이드선 제거
                hintText: '이메일 주소 입력',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF305984),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15), //패딩 조절
                suffixIcon: IconButton(
                  onPressed: (){
                  context.pop(); //입력한 이메일 지우기
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 20,
                  ),
                  hoverColor: Colors.transparent, //마우스오버 효과(hoverSplash)제거
                )
              ),
              style: TextStyle(
                fontSize: 15,
                color: Colors.white
              ),//텍스트 글자 색
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
//다음 버튼 - AppLayout에서 RegisterUILayout에 사용할 것
class NextButton extends StatelessWidget{
  const NextButton ({super.key, required this.onPressed});

  final VoidCallback onPressed; //클릭시 반환할 함수 받기

  @override
  Widget build(BuildContext context){
    return Container(
      width: 650,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF3B4768),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(650, 50),
            foregroundColor: Color(0xFF3B4768) //마우스 오버 효과제거
        ),
        child: Text(
          '다음',
          style: TextStyle(
            fontFamily:'Arial',
            fontSize: 20,
            color: Color(0xFF919EB2),
          ),
        ),
      ),
    );
  }
}