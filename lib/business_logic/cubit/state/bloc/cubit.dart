import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/state.dart';
import '../../../../data/models/repostry/api/Carcters.dart';
import '../../../../data/models/repostry/api/ChaructersRepostry.dart';

class CaractersCubit extends Cubit<CaractersState> {
  final ChaructersRepostry chaructersRepostry;
  List<Caracter> caracters = [];

  CaractersCubit(this.chaructersRepostry) : super(CarctersInitialState());

  List<Caracter> getAllCharactars() {
    chaructersRepostry.getAllCharactars().then((caracters) {
      emit(CaractersLaodedState(caracters));

      this.caracters = caracters;
    });
    return caracters;
  }
}
