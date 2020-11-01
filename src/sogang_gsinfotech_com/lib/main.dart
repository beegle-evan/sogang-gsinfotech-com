import 'package:flutter/material.dart';
import 'constant/constant.dart';
import 'route/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GsinfotechCommunityApp());
}

class GsinfotechCommunityApp extends StatefulWidget {
  @override
  _GsinfotechCommunityAppState createState() => _GsinfotechCommunityAppState();
}

class _GsinfotechCommunityAppState extends State<GsinfotechCommunityApp> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return MaterialApp(
      title: APP_TITLE,
      initialRoute: '/Splash',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.white
      )
    );
  }
}
