import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmarket/models/models.dart';
import 'package:foodmarket/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue result = await FoodServices.getFoods();

    if (result != null) {
      emit(FoodLoaded(foods: result.value));
    } else {
      emit(FoodLoadFailed(message: result.message));
    }
  }
}
