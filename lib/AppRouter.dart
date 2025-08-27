import 'package:flutter/material.dart';
import 'package:project_bloc/CharactarsScreen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CharactarsScreen());
    }
  }
}
