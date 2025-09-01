import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

abstract class CaractersState {}

class CarctersInitialState extends CaractersState {}

class CaractersLaodedState extends CaractersState {
  final List<Caracter> caracters;

  CaractersLaodedState(this.caracters);
}
