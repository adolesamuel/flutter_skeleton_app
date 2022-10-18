import 'package:flutter/material.dart';
import 'package:skels/ui/auth/sign_in_page.dart';

import 'models/authentication/authenticated_user.dart';

const String homeRoute = '/home';

class ScreenPaths {
  static const String loginScreen = '/';
}

Map<String, WidgetBuilder> routes({required AuthenticatedUser? user}) {
  return <String, WidgetBuilder>{
    //if user is logged in return dashboard with user, else return loginpage

    LogInScreen.route: (context) => const LogInScreen(),
  };
}

Route<dynamic>? generateRoutes(RouteSettings settings) {
  //This feature only works on androidd currently,
  // if (settings.name!.startsWith('/Reset')) {
  //   return MaterialPageRoute(
  //       builder: (context) => PasswordResetPage(
  //             slug: settings.name!.split('/').last,
  //           ));
  // } else {
  //   return MaterialPageRoute(builder: (context) => const UnknownPage());
  // }
}
