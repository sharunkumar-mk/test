import 'package:flutter/material.dart';
import 'package:test_app/constants/routes_path.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/modules/pages/home.dart';
import 'package:test_app/modules/pages/profile_info.dart';
import 'package:test_app/modules/pages/users.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case usersScreen:
        return MaterialPageRoute(
          builder: (_) => const UsersPage(),
        );

      case profileInfoScreen:
        User user = settings.arguments as User;

        return MaterialPageRoute(
          builder: (_) => ProfileInfoPage(
            user: user,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route found for the name $settings.name',
              ),
            ),
          ),
        );
    }
  }
}
