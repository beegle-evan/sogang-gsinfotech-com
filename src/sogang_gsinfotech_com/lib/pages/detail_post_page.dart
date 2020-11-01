import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailPostPage extends StatefulWidget {
  final DocumentSnapshot document;
  final FirebaseUser user;

  DetailPostPage(this.document, this.user);

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      widget.document['userPhotoUrl']),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            widget.document['email'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: _follow,
                              child: Text(
                                  "팔로우",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                          ),
                        ],
                      ),
                      Text(widget.document['displayName']),
                    ],
                  ),
                )
              ],
            ),
          ),
          Hero(
            tag: widget.document['photoUrl'],
            child: Image.network(widget.document['photoUrl']),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.document['contents']),
          ),
        ],
      ),
    );
  }

  // follow
  void _follow() {

  }

  // unfollow
  void _unfollow() {

  }
}