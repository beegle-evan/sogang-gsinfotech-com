import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                        'Instagram에 오신 것을 환영합니다.',
                        style: TextStyle(
                            fontSize: 24.0
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Text(
                      '사진과 동영상을 보려면 팔로우 하세요.',
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    SizedBox(
                      width: 240.0,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 80.0,
                              height: 80.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                user.displayName
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', fit:BoxFit.cover)
                                ),
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', fit:BoxFit.cover)
                                ),
                                SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: Image.network('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', fit:BoxFit.cover)
                                )
                              ],
                            ),
                            RaisedButton(
                              child: Text(
                                  '팔로우'
                              ),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}
