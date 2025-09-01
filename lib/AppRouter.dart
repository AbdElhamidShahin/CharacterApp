import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/CharactarsScreen.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/cubit.dart';
import 'package:project_bloc/data/models/repostry/api/CarcterWebServise.dart';
import 'Presnetaion/widget/Screens/CharactarsDetailsScreen.dart';
import 'constance/Strings.dart';
import 'data/models/repostry/api/ChaructersRepostry.dart';

class AppRouter {
  late ChaructersRepostry chaructersRepostry;
  late CaractersCubit caractersCubit;

  AppRouter() {
    chaructersRepostry = ChaructersRepostry(CarcterWebServise());
    caractersCubit = CaractersCubit(chaructersRepostry);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case carctersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => caractersCubit,
            child: CharactarsScreen(),
          ),
        );
      case carctersDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const CharactarsDetailsScreen(),
        );
    }
  }
}
