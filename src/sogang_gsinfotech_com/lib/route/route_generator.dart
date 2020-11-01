import 'package:flutter/material.dart';
import '../pages/splash_page.dart';
import '../pages/root_page.dart';
import '../pages/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/Root':
        return MaterialPageRoute(builder: (_) => RootPage());
      case '/Login':
         return MaterialPageRoute(builder: (_) => LoginPage());
      // case '/ForgetPassword':
      //   return MaterialPageRoute(builder: (_) => ForgetPasswordWidget());
      // case '/SignUp':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/Home':
      //   return MaterialPageRoute(builder: (_) => HomePage());
      // case '/Matching':
      //   return MaterialPageRoute(builder: (_) => MatchingPage());
      // case '/Camera':
      //   return MaterialPageRoute(fullscreenDialog: true, builder: (_) => CameraPage());
      // case '/VideoOption':
      //   return MaterialPageRoute(builder: (_) => VideoOptionPage());
      // case '/Help':
      //   return MaterialPageRoute(builder: (_) => HelpPage());
      // case '/Tnc':
      //   return MaterialPageRoute(builder: (_) => TnC());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        //return MaterialPageRoute(builder: (_) => RootPage());

    }
  }
}
