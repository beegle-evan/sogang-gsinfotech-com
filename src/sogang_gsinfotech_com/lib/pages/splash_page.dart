import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../constant/constant.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends StateMVC<SplashPage> {
  SplashPageState() : super() {
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    Future.delayed(Duration(seconds: 2), () => {
      Navigator.of(context).pushReplacementNamed('/Root')
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  APP_LOGO_CIRCLE_PATH,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  APP_TITLE_WITHOUT_LOGO,
                  style: TextStyle(
                      fontSize: 30.0,
                      textBaseline: TextBaseline.alphabetic,
                      color: Colors.black
                  ),
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("종료하시겠습니까?"),
        actions: <Widget>[
          FlatButton(
            child: Text("응"),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            child: Text("아뉘"),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      ),
    ) ?? false;
  }
}
