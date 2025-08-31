import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

abstract class CarctersState {}

class CarctersInitialState extends CarctersState {}

class CaractersLaodedState extends CarctersState {
  final List<Caracter> caracters;

  CaractersLaodedState(this.caracters);
}
