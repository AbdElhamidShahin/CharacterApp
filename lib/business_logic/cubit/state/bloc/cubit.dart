import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/state.dart';
import '../../../../data/models/repostry/api/Carcters.dart';
import '../../../../data/models/repostry/api/ChaructersRepostry.dart';

class CaractersCubit extends Cubit<CaractersState> {
  final CharauctersRepostry charauctersRepostry;
  List<Caracter> caracter = [];

  CaractersCubit(this.charauctersRepostry) : super(CarctersInitialState());
  List<Caracter> getAllCharactars() {
    charauctersRepostry.getAllCharactars().then((caracter) {
      emit(CaractersLaodedState(caracter));
      this.caracter = caracter;
    });
    return caracter;
  }
}
