import 'package:flutter/material.dart';
import 'package:project_bloc/CharactarsScreen.dart';

import 'Presnetaion/widget/Screens/CharactarsDetailsScreen.dart';
import 'constance/Strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case carctersScreen:
        return MaterialPageRoute(builder: (_) => const CharactarsScreen());
      case carctersDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharactarsDetailsScreen());
    }
  }
}
