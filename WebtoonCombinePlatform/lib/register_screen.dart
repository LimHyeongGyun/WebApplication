import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';
import 'AppLayout.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen ({super.key});

  @override
  Widget build(BuildContext context){
    return RegisterUILayout(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false
        ),
      ),
    );
  }
}