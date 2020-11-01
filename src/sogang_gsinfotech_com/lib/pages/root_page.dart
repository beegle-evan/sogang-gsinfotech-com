import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'loading_page.dart';
import 'login_page.dart';
import 'tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('root_page created');
    return _handleCurrentScreen();
  }

  Widget _handleCurrentScreen() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 연결 상태가 기다리는 중이라면 로딩 페이지를 반환
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          if (snapshot.hasData) {
            // 데이터가 있을때
            return TabPage(snapshot.data);
          } else {
            // 데이터가 없을때
            return LoginPage();
          }
        }
      },
    );
  }
}

